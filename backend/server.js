require("dotenv").config();
const express = require("express");
const app = express();
const cors = require("cors");
const db = require("./database/index");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

//      Middle wares
app.use(cors());
app.use(express.json());
// app.use(express.urlencoded());

// Get all books
app.get("/api/books", async (req, res) => {
  try {
    const result = await db.query(
      "SELECT book_id,book_name,book_img,category FROM books;"
    );
    // console.log(result);
    res.status(200).json({ status: "success", data: result.rows });
  } catch (err) {
    console.log(err);
    console.log(err.msg);
  }
});

// Get a single book

app.get("/api/book/:id/details", async (req, res) => {
  try {
    const { id } = req.params;
    const result = await db.query(
      "SELECT b.book_id,b.book_name,b.author,b.category,b.online_link,b.book_img,COALESCE(r.avg_rating,0) AS avg_rating,COALESCE(r.total_reviews,0) AS total_reviews,b.book_description  FROM books AS b LEFT JOIN (SELECT book_id,TRUNC(AVG(rating),1) AS avg_rating,COUNT(book_id) AS total_reviews FROM reviews GROUP BY book_id) AS r ON r.book_id = b.book_id WHERE b.book_id = $1;",
      [id]
    );
    res.status(200).json({
      status: "success",
      data: result.rows[0] ? result.rows[0] : null,
    });
  } catch (err) {
    console.log(err);
    console.log(err.msg);
    res.json({
      status: "failed",
      msg: err.message,
    });
  }
});

//      Search for books by book name
app.get("/api/search", async (req, res) => {
  const query = req.query.q;
  const result = await db.query(
    `SELECT book_id,book_name,book_img,category FROM books WHERE book_name ILIKE '%${query}%';`
  );

  res.json({
    status: "success",
    data: result.rows ? result.rows : null,
  });
});

// Search for books by category
app.get("/api/search/category", async (req, res) => {
  const category = req.query.category;
  const result = await db.query(
    "SELECT book_id,book_name,book_img,category FROM books WHERE category = $1;",
    [category]
  );
  res.json({
    status: "success",
    data: result.rows ? result.rows : null,
  });
});

// Add a Book to the database
app.post("/api/books/add", async (req, res) => {
  const {
    book_name,
    author,
    category,
    book_img,
    online_link,
    book_description,
  } = req.body;
  try {
    const response = await db.query(
      "INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ($1,$2,$3,$4,$5,$6) RETURNING * ;",
      [book_name, author, category, book_img, online_link, book_description]
    );
    res.json({
      status: "success",
      data: response.rows[0],
    });
  } catch (err) {
    console.log(err.message);
    res.json({
      status: "failed",
      msg: err.message,
    });
  }
});

//      Authentication
//    Sign Up Form
app.post("/auth/signup", async (req, res) => {
  const { f_name, l_name, e_mail, password } = req.body;
  let response = await db.query(`SELECT * FROM users WHERE e_mail=$1;`, [
    e_mail,
  ]);
  if (response.rows.length >= 1) {
    res.json({
      status: "failed",
      msg: "User already exits with that mail id..",
    });
  } else {
    try {
      let encryted = await bcrypt.hash(password, 10);
      let insert = await db.query(
        "INSERT INTO users (f_name,l_name,e_mail,user_password) VALUES ($1,$2,$3,$4) RETURNING user_id ;",
        [f_name, l_name, e_mail, encryted]
      );
      let payload = insert.rows ? insert.rows[0] : res.send("Rows are empty");
      let token = await jwt.sign(payload, process.env.TOKEN_PASSWORD, {
        expiresIn: "1hr",
      });
      // let verify = jwt.verify(token, process.env.TOKEN_PASSWORD);
      res.json({
        // first_name: f_name,
        // last_name: l_name,
        // e_mail,
        // password: encryted,
        // data: payload,
        status: "success",
        token,
        // verify,
        // insert,
      });
    } catch (err) {
      console.log(err);
      console.log(err.message);
    }
  }
});

//      Login Form
app.post("/auth/login", async (req, res) => {
  try {
    const { e_mail, password } = req.body;
    const response = await db.query("SELECT * FROM users WHERE e_mail = $1", [
      e_mail,
    ]);
    if (response.rows.length === 0) {
      res.json({
        status: "login failed!",
        msg: "No user exits with that mail.",
      });
    } else {
      const verify = await bcrypt.compare(
        password,
        response.rows[0].user_password
      );
      if (verify) {
        const user_id = response.rows[0].user_id;
        const token = jwt.sign({ user_id }, process.env.TOKEN_PASSWORD, {
          expiresIn: "1hr",
        });
        res.json({
          status: "success",
          token,
        });
      } else {
        res.json({
          status: "login failed!",
          msg: "Incorrect Password",
        });
      }
    }
  } catch (error) {
    console.log(error);
    console.log(error.message);
  }
});

//        Verify a User

app.post("/auth/verify", async (req, res) => {
  const { token } = req.headers;
  // console.log(req.headers);
  // console.log(token);
  try {
    if (token) {
      try {
        const verify = jwt.verify(token, process.env.TOKEN_PASSWORD);
        res.json({
          status: "success",
          user_id: verify.user_id,
        });
      } catch (err) {
        res.json({
          status: "failed",
          msg: err.message,
        });
      }
    } else {
      res.json({
        status: "failed",
        msg: "No token found in headers",
      });
    }
  } catch (err) {
    console.log(err);
    console.log(err.message);
  }
});

//      Get a User Information
app.get("/auth/user/:id", async (req, res) => {
  const { id } = req.params;
  try {
    try {
      const response = await db.query(
        "SELECT user_id,f_name,l_name,e_mail,user_pic,isadmin FROM users WHERE user_id = $1",
        [id]
      );
      if (response.rows.length === 0) {
        res.json({
          status: "failed",
          msg: "No user with that id",
        });
      } else {
        res.json({
          status: "success",
          data: response.rows[0],
        });
      }
    } catch (error) {
      console.log(error);
      console.log(error.message);
    }
  } catch (error) {
    console.log(error);
    console.log(error.message);
  }
});

//    Update user Profile Avatar
app.put("/auth/user/profile/avatar", async (req, res) => {
  const { id, avatar } = req.body;
  try {
    const response = await db.query(
      "UPDATE users SET user_pic=$1 WHERE user_id=$2 RETURNING user_id,f_name,l_name,e_mail,user_pic;",
      [avatar, id]
    );
    res.json({
      status: "success",
      data: response.rows[0],
    });
  } catch (err) {
    console.log(err);
    console.log(err.message);
  }
});

// Update User Details
app.put("/auth/user/profile/details", async (req, res) => {
  const { user_id, f_name, l_name, e_mail } = req.body;
  try {
    const getUser = await db.query(
      "SELECT * FROM users WHERE e_mail = $1 AND user_id != $2;",
      [e_mail, user_id]
    );
    if (getUser.rows.length === 0) {
      try {
        const response = await db.query(
          "UPDATE users SET f_name=$1,l_name=$2,e_mail=$3 WHERE user_id=$4 RETURNING user_id,f_name,l_name,e_mail,user_pic;",
          [f_name, l_name, e_mail, user_id]
        );
        res.json({
          status: "success",
          data: response.rows[0],
        });
      } catch (err) {
        console.log(err);
        console.log(err.message);
      }
    } else {
      res.json({
        status: "failed",
        msg: "Email id already exits",
      });
    }
  } catch (err) {
    console.log(err);
    console.log(err.message);
  }
});
//  Update user password
app.put("/auth/user/profile/password", async (req, res) => {
  const { password, user_id } = req.body;
  try {
    let encryted = await bcrypt.hash(password, 10);
    const response = await db.query(
      "UPDATE users SET user_password=$1 WHERE user_id=$2;",
      [encryted, user_id]
    );
    res.json({
      status: "success",
      data: response,
    });
  } catch (err) {
    console.log(err);
    console.log(err.message);
  }
});

//        Add a book to collections

app.post("/auth/user/profile/add/book", async (req, res) => {
  const { book_id, user_id } = req.body;
  try {
    const response = await db.query(
      "INSERT INTO saved_books (user_id,book_id) VALUES ($1,$2) RETURNING *;",
      [user_id, book_id]
    );
    res.json({
      status: "success",
      data: response.rows[0],
    });
  } catch (err) {
    console.log(err);
    console.log(err.message);
  }
});

//      Remove a book from collections

app.delete(
  "/auth/user/:user_id/profile/remove/book/:book_id",
  async (req, res) => {
    const { user_id, book_id } = req.params;
    try {
      await db.query(
        "DELETE FROM saved_books WHERE user_id=$1 AND book_id=$2",
        [user_id, book_id]
      );
      res.json({
        status: "success",
      });
    } catch (err) {
      console.log(err);
      console.log(err.message);
    }
  }
);

//    Get saved books
app.get("/auth/user/:user_id/profile/get/saved_books", async (req, res) => {
  const { user_id } = req.params;
  // console.log(user_id);
  try {
    const response = await db.query(
      "SELECT saved_books.book_id,books.book_name,books.book_img FROM saved_books INNER JOIN books ON saved_books.book_id = books.book_id WHERE saved_books.user_id=$1;",
      [user_id]
    );
    res.json({
      status: "success",
      total_books: response.rows.length,
      data: response.rows,
    });
  } catch (err) {
    console.log(err);
    console.log(err.message);
  }
});
//              REVIEWS

//      Add a review

app.post("/review/add/user", async (req, res) => {
  const { book_id, user_id, rating, review } = req.body;
  try {
    const match = await db.query(
      "SELECT * FROM reviews WHERE book_id = $1 AND user_id=$2;",
      [book_id, user_id]
    );
    if (match.rows.length === 0) {
      try {
        const response = await db.query(
          "INSERT INTO reviews (book_id,user_id,rating,review) VALUES ($1,$2,$3,$4) RETURNING *;",
          [book_id, user_id, rating, review]
        );
        res.json({
          status: "success",
          data: response.rows[0],
        });
      } catch (err) {
        console.log(err);
        console.log(err.message);
        res.json({
          status: "failed",
          msg: err.message,
        });
      }
    } else {
      try {
        const response = await db.query(
          "UPDATE reviews SET rating=$1,review=$2 WHERE user_id=$3 AND book_id=$4 RETURNING *;",
          [rating, review, user_id, book_id]
        );
        res.json({
          status: "success",
          data: response.rows[0],
        });
      } catch (err) {
        console.log(err);
        console.log(err.message);
        res.json({
          status: "failed",
          msg: err.message,
        });
      }
    }
  } catch (err) {
    console.log(err.message);
    res.json({
      status: "failed",
      msg: err.message,
    });
  }
});

// Get reviews by book id
app.get("/review/get/book/:id", async (req, res) => {
  const { id } = req.params;
  try {
    const response = await db.query(
      "SELECT reviews.book_id,CONCAT(users.f_name,' ',users.l_name) AS user_name,users.user_pic,reviews.rating,reviews.review FROM reviews INNER JOIN users ON reviews.user_id = users.user_id WHERE reviews.book_id=$1;",
      [id]
    );
    res.json({
      status: "success",
      data: response.rows,
    });
  } catch (err) {
    res.json({
      status: "failed",
      msg: err.message,
    });
    console.log(err.message);
  }
});

// Get reviews by user id
app.get("/review/get/user/:id", async (req, res) => {
  const { id } = req.params;
  try {
    const response = await db.query(
      "SELECT reviews.review_id,reviews.user_id,reviews.book_id,books.book_name,reviews.rating,reviews.review FROM reviews INNER JOIN books ON reviews.book_id = books.book_id WHERE reviews.user_id = $1;",
      [id]
    );
    res.json({
      status: "success",
      data: response.rows,
    });
  } catch (err) {
    res.json({
      status: "failed",
      msg: err.message,
    });
    console.log(err.message);
  }
});
app.delete("/review/:review_id/delete/user/:user_id", async (req, res) => {
  const { user_id, review_id } = req.params;
  try {
    const response = await db.query(
      "DELETE FROM reviews WHERE review_id=$1 AND user_id = $2 RETURNING *;",
      [review_id, user_id]
    );
    res.json({
      status: "success",
      data: response.rows[0],
    });
  } catch (err) {
    console.log(err.message);
    res.json({
      status: "failed",
      msg: err.message,
    });
  }
});
app.listen(5000, () => {
  console.log("sever is up and listening on port 5000...");
});
