CREATE DATABASE digital_library;

CREATE TABLE books (
    book_id BIGSERIAL PRIMARY KEY NOT NULL,
    book_name VARCHAR(200) NOT NULL,
    author VARCHAR(100) NOT NULL,
    category VARCHAR(70) NOT NULL,
    book_img INT NOT NULL,
    online_link VARCHAR(500) NOT NULL,
    book_description TEXT NOT NULL
);

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('The Complete Sherlock Holmes','Arthur Conan Doyle','Story',8351939,'TheCompleteSherlockHolmesIllustrated/page/n1/mode/2up','The Complete Sherlock Holmes is a collection of twelve short stories by Arthur Conan Doyle, first published on 14 October 1892. It contains the earliest short stories featuring the consulting detective Sherlock Holmes, which had been published in twelve monthly issues of The Strand Magazine from July 1891 to June 1892. The stories are collected in the same sequence, which is not supported by any fictional chronology.The only characters common to all twelve are Holmes and Dr. Watson and all are related in first-person narrative from Watson''s point of view.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('Heidi','Johanna Spyri','Story',8236370,'heidi00spyr','A Swiss orphan is heartbroken when she must leave her beloved grandfather and their happy home in the mountains, to go to school and to care for an invalid girl in the city.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('Venus And Adonis','William Shakespeare','Art',9214113,'venusadonisfirst00shakuoft','Adonis is a youth of unsurpassed beauty. A hunter. The goddess Venus, sees him and falls madly in love with him. Venus''s love becomes boundless and without limit and Adonis rejects her even though she is a beautiful goddess and the goddess of love. And thereby hangs a tale. The story is told through the lamentations of Venus for Adonis''s rejection of her love.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('Max Ernst','Max Ernst','Art',7879121,'maxer00erns','Max Ernst: Life and Work draws on an unprecedented collection of source material, much of it published here for the first time, to present a compelling portrait of the artist''s life and an intellectual portrait of an entire period. These letters and notes by friends and contemporaries provide insight into the reception of his oeuvre, illustrate Ernst''s own texts and shed light on his biography');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('The Lost World',' Arthur Conan Doyle','Science Fiction',8231444,'lostworldbeingac00doylrich','Journalist Ed Malone is looking for an adventure, and that''s exactly what he finds when he meets the eccentric Professor Challenger - an adventure that leads Malone and his three companions deep into the Amazon jungle, to a lost world where dinosaurs roam free.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('The Time Machine','Herbert George Wells','Science Fiction',8231888,'timemachineinven00well','The Time Traveller, a dreamer obsessed with traveling through time, builds himself a time machine and, much to his surprise, travels over 800,000 years into the future. He lands in the year 802701: the world has been transformed by a society living in apparent harmony and bliss, but as the Traveler stays in the future he discovers a hidden barbaric and depraved subterranean class');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('At The Earth''s Core','Edgar Rice Burroughs','Science Fiction',9317372,'atearthscore00burr','Dr. Abner Perry has invented a high-calibration digging machine affectionately called ''The Iron Mole''. While testing his invention with his financial backer and former student David Innes, the machine malfunctions and the pair end up burrowing deep into the earth to emerge in Pellucidar, a lush underground cavern filled with giant prehistoric creatures. While fleeing one such creature, Dr. Perry and David are captured by strange inhuman soldiers, called Sagoths, and placed with other human slaves, where they meet Ghak and the beautiful Princess Dia.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('A Princess Of Mars','Edgar Rice Burroughs','Science Fiction',7214202,'princessofmars00burriala','I am a very old man,how old I do not know. Possibly I am a hundred, possibly more; but I cannot tell because I have never aged as other men, nor do I remember any childhood. So far as I can recollect I have always been a man, a man of about thirty. I appear today as I did forty years and more ago, and yet I feel that I cannot go on living forever; that some day I shall die the real death from which there is no resurrection. From Adventures of John Carter in Mars from the author of the Tarzan series.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('The First Men In The Moon','Herbert George Wells','Science Fiction',9043083,'firstmeninmoo00well','When penniless businessman Mr Bedford retreats to the Kent coast to write a play, he meets by chance the brilliant Dr Cavor, an absent-minded scientist on the brink of developing a material that blocks gravity. Cavor soon succeeds in his experiments, only to tell a stunned Bedford the invention makes possible one of the oldest dreams of humanity: a journey to the moon.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('The War Of The Worlds','Herbert George Wells','Science Fiction',8231837,'warofworlds1898well','The ultimate science fiction classic: for more than one hundred years, this compelling tale of the Martian invasion of Earth has enthralled readers with a combination of imagination and incisive commentary on the imbalance of power that continues to be relevant today. The style is revolutionary for its era, employing a sophisticated first and third person account of the events which is both personal and focused on the holistic downfall of Earth''s society.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('The Scarlet Plague ','Jack London','Science Fiction',9377992,'cu31924021764158','It is the year 2072, sixty years on from the scarlet plague that decimated the earth''s population. As one of the few who knew life before the plague, James Howard Smith tries to impart what he knows to his grandsons while he still can. Jack London''s visionary post-apocalyptic novel The Scarlet Plague was written in 1912.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('The Origin Of Species','Charles Darwin','Science',6049046,'originofspecies00darwuoft','Charles Darwin''s seminal work laying the foundations for the principles of evolutionary biology via natural selection, based on evidence that he collected during his expedition on HMS Beagle in the 1830s.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('On The Nature Of Things.','Titus Lucretius Carus','Science',5909381,'onnatureofthings01lucruoft','This is regarded as a seminal text of Epicurean science and philosophy. Epicurians discarded both the idea of immortality and the superstitious worship of wilful gods for a life of serene contentment in the available pleasures of nature. Lucretius (c100-c55BC), in elucidating this belief, steers the reader through an extraordinary breadth of subject matter, ranging from the indestructibility of atoms and the discovery of fire to the folly of romantic love and the phenomena of clouds and rainstorms.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('The Tour Of The World In Eighty Days','Jules Verne','Science',6103431,'tourofworldineig00vern','Phileas Fogg, a very punctual man had broken into an argument while conversing about the recent bank robbery. To keep his word of proving that he would travel around the world in 80 days and win the bet, he sets on a long trip, where he is joined by a few other people on the way. A wonderful adventure is about to begin.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('Of The Proficience And Advancement Of Learning','Francis Bacon','Science',8242336,'proficienceanda00bacogoog','The Advancement of Learning (full title: Of the Proficience and Advancement of Learning, Divine and Human) is a 1605 book by Francis Bacon. It inspired the taxonomic structure of the highly influential Encyclopedie by Jean le Rond d''Alembert and Denis Diderot, and is credited by Bacon''s biographer-essayist Catherine Drinker Bowen with being a pioneering essay in support of empirical philosophy.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('The Literary Works Of Leonardo Da Vinci','Leonardo da Vinci','Science',5623354,'literaryworksofl01leonuoft','This fantastic reproduction of the Italian written work of Leonardo da vinci with accompanying English translation organizes his disjointed notes and pages by subject and literary genre.here is my original contribution. the author was the son of an Italian father and an Arabic mother. the mother was not married to his father, but was probably a servant in the household. Leonardo was taught to write by an Arabic person, probably his mother, and wrote from right to left, according to the sound, with little connection to the words'' spelling and length in a literate');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('Experiments With Alternate Currents Of High Potential And High Frequency.','Nikola Tesla','Science',858197,'experimentswitha00tesl_0','Some of the experiments may be performed with low frequencies; but very high frequencies are desirable, not only on account of the many effects secured by their use, but also as a convenient means of obtaining, in the induction apparatus employed, the high potentials, which in their turn are necessary to the demonstration of most of the experiments here contemplated.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('The Adventures Of Tom Sawyer','Mark Twain','Story',9319652,'tomsawyerabroad00twaiiala','The adventures and pranks of a mischievous boy growing up in a Mississippi River town in the early nineteenth century.Tom''s plan to become famous involves Huck Finn and his friend Jim in a crusade to the Holy Land by balloon ascension.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('Oliver Twist','Charles Dickens','Story',9282608,'dickensworks10dickuoft','Oliver Twist, OR: the Parish Boy''s Progress, is Charles Dickens''s second novel, and was first published as a serial from 1837 to 1839. The story centres on orphan Oliver Twist, born in a workhouse and sold into apprenticeship with an undertaker. After escaping, Oliver travels to London, where he meets the ''Artful Dodger'', a member of a gang of juvenile pickpockets led by the elderly criminal Fagin.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('Little Ferns For Fanny''s Little Friends','Fanny Fern','Story',2895668,'littlefernsforf00ferngoog/page/n8/mode/2up','Aunt Fanny has written, you some stories, which she hopes will please aid divert you. She would rather have come to you, and told them, that she might have seen your hright faces , but as that could not be, she sends her little book instead. Perhaps you will sometime come and see her, and then, won''t we have a nice time telling stories');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('Story Of Little Black Sambo','Helen Bannerman','Story',8243203,'storyoflittlebla1903bann','A retelling of the well-known tale in which a little Indian boy finally outwits the succession of tigers that want to eat him.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('Beautiful Stories About Children','Charles Dickens','Story',9279364,'beautifulstories00dick/page/n1/mode/2up','It was Dickens who made it popular to keep Christmas with acts of helpfulness to the poor. Every barefooted boy and girl in the streets of England and America to-day fares a little better, gets fewer cuffs and more pudding because Charles Dickens wrote. He has softened the hearts of more than a generation. He made charity fashionable and awakened the pity and brotherly love of millions of people');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('Stories For Little Children','Hayes Mother.','Story',5772799,'storiesforlittle02hayeiala','These are the stories that makes you feel good. Hayes wrote these stories with passion and the sentense that she used to describe things will mesmorize the readers.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('College Algebra And Trigonometry','Robert Ellis','Mathematics',8009059,'collegealgebratr00ell_nn5/page/n11/mode/2up','This book contains a review of basic algebra concepts and can be covered quickly or slowly depending on reader. Chapters 2 to 5 represents the main topics of college algebra');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('Feynman''s Lost Lecture','David L. Goodstein','Mathematics',78105,'feynmanslostlect00good_1','Winner of Nobel prize for Physics, the Richard Feynman taught many years at Califonia Institute of Technology. He is known to wide reader ship as the author of Surely you are joking,Mr Feynman and What do you care What other people think.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('Calculus A Problem-solving Approach','Neal E. Reid','Mathematics',10580976,'calculusproblems0000reid','In this books all concepts of calculus are cover teaching from very basics.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('Geometry','Siegfried Haenisch','Mathematics',10636868,'agsgeometry0000haen','Siegfried Haenisch has taught mathematics at every level from elementry to graduate most recently as professor in department of mathematics and statistics at the college of new jersey. He explained mathematical concepts in this book in way that any one can understand.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('Calculus A Problem-solving Approach','D. Goldfeld','Mathematics',9795737,'calculuscomputer0000ansh','It container chapter like Introduction ch. 0: What is calculus. ch. I: Functions and their graphs ch. II: The algebra of functions  ch. III: Lines, circles, and curves : a review ch. IV: Limits and continuity ch. V: The derivative ch. VI: Basic applications of the derivative ch. VII: The rules of calculus ch. VIII: Implicitly defined functions and their derivatives ch. IX: The maxima and minima of functions etc... and many more');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('Madame Curie','Curie Eve','Biography',6618148,'madamecuriebiogr00curi','This is the biography of madame curie discoverer of radium and Nobel Prize winner, one of the greatest woman scientist whose work changed the course of the world''s thinking as that of other great women.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('An Autobiography The Story Of My Experiments With Truth.','Mohandas Karamchand Gandhi','Biography',6614684,'autobiographysto00gand','Gandhi''s non-violent struggles against racism, violence, and colonialism in South Africa and India had brought him to such a level of notoriety, adulation that when asked to write an autobiography midway through his career, he took it as an opportunity to explain himself.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('Freedom In Exile The Autobiography Of The Dalai Lama.','14th Dalai Lama','Biography',6639542,'freedominexileau00bsta','Authobiography of the Dalai Lama XIV.Among the world leaders there is no one like this holiness the Dalai Lama, religious and head of Tibet and Winner of Nobel Peace Prize.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('Alan Turing The Enigma','Andrew Hodges','Biography',6381830,'alanturingenigma00hodg','Alan Turing: The Enigma (1983) is a biography of the British mathematician, codebreaker, and early computer scientist, Alan Turing (1912???1954) by Andrew Hodges. The book covers Alan Turing''s life and work. The American 2014 film The Imitation Game is loosely based on the book, with dramatization.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('Louis Braille, The Boy Who Invented Books For The Blind','Margaret Davidson','Biography',6877227,'louisbrailleboy00davi','The life of the 19th-century Frenchman who invented an alphabet enabling the blind to read.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('Statistical Analysis','Allen Louis Edwards','Mathematics',7155528,'statisticalanaly00edwa','Here you can learn learn all models of statistical analysis like chi squared test, t- test, Analysis of Variance from basics which well teached by Allen Louis.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('Conceptual Physics The High School Physics Program','Paul G. Hewitt','Science',9555024,'conceptualphysic00paul','Paul''s ability to communicate the concepts of physics through simple language is awesome and good demonstrations are made throughout the book for good understanding');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('The Hobbit','J.R.R. Tolkien','Fantasy',11574888,'hobbitortherebac0000tolk_b5p9','The Hobbit is a tale of high adventure, undertaken by a company of dwarves in search of dragon-guarded gold. A reluctant partner in this perilous quest is Bilbo Baggins, a comfort-loving unambitious hobbit, who surprises even himself by his resourcefulness and skill as a burglar.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('Charlie And The Chocolate Factory','Roald Dahl','Fantasy',10197258,'charliechocolate0000dahl','Five children and only five were going to be allowed into Mr. Willy Wonka''s chocolate factory. The lucky five would get to see all the mysterious machinery in the factory where the world''s most wonderful candy was made.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('Harry Potter And The Prisoner Of Azkaban','J. K. Rowling','Fantasy',11025027,'harrypotteryelpr0003rowl','For Harry Potter, it''s the start of another far-from-ordinary year at Hogwarts when the Knight Bus crashes through the darkness and comes to an abrupt halt in front of him. It turns out that Sirius Black, mass-murderer and follower of Lord Voldemort, has escaped ??? and they say he is coming after Harry.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('The Marvelous Land Of Oz','John R. Neill','Fantasy',8232017,'marvelouslandofo00baum','Tip and his creation, Jack Pumpkin, run away to Oz where they save the city after it is captured by girls.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('The Bfg','Roald Dahl','Fantasy',10410689,'lebongrosgeantle0000dahl','This book is a great book for all ages. It is a fantasy/adventure book.The BFG stands for ''Big Friendly Giant''. He isn''t like other giants, instead of going out to different countries to eat children he catches dreams. When he find''s a little orphan girl watching him, he kidnaps her because he doesn''t want anyone to find out that he was there, but when they arrive at giant''s land they become friends and set off into the world to save all the children from the hungry giants.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('The Cat In The Hat','Dr. Seuss','Fantasy',5418029,'elgatoensombrera0000seus','Two children sitting at home on a rainy day are visited by the Cat in the Hat, who shows them some tricks and games. Includes a Latin-English glossary and a note on the verse form and rhythm.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('The Story Of Doctor Dolittle','Hugh Lofting','Fantasy',5913414,'storyofdoctordol00loft','There are some of us now reaching middle age who discover themselves to be lamenting the past in one respect if in none other, that there are no books written now for children comparable with those of thirty years ago. I say written FOR children because the new psychological business of writing ABOUT them as though they were small pills or hatched in some especially scientific method is extremely popular today.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('Mary Poppins','P. L. Travers','Fantasy',9579879,'marypoppins00trav_0','An extraordinary English nanny blows in on the East Wind with her parrot-headed umbrella and magic carpetbag and introduces her charges, Jane and Michael, to some delightful people and experiences.');

INSERT INTO books (book_name,author,category,book_img,online_link,book_description) VALUES ('Peter Pan','J. M. Barrie','Fantasy',10795716,'peterpan0000barr_w9n1','A mischievous boy who can fly and never grows up, Peter Pan spends his never-ending childhood having adventures on the small island of Neverland as the leader of his gang, the Lost Boys, interacting with mermaids, Native Americans, fairies, pirates, and occasionally ordinary children from the world outside Neverland.');

CREATE TABLE users (
    user_id BIGSERIAL PRIMARY KEY NOT NULL,
    f_name VARCHAR(100) NOT NULL,
    l_name VARCHAR(100) NOT NULL,
    e_mail VARCHAR(50) NOT NULL,
    user_password TEXT NOT NULL,
    user_pic INT  
);
CREATE TABLE saved_books (
    user_id BIGINT REFERENCES users(user_id),
    book_id BIGINT REFERENCES books(book_id)
);

CREATE TABLE reviews(
    review_id BIGSERIAL PRIMARY KEY NOT NULL,
    book_id BIGINT REFERENCES books(book_id),
    user_id BIGINT REFERENCES users(user_id),
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    review TEXT NOT NULL
);