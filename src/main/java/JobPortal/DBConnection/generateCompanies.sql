DELETE FROM companies;
ALTER TABLE companies
    AUTO_INCREMENT = 1;
INSERT INTO companies (username, name, About, email, password, credit)
VALUES ('cclemmens0', 'Bosco-Mills',
        'Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.',
        'company@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 90),
       ('lbarnsdale1', 'Jacobs, Batz and Terry',
        'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'jlinthead1@exblog.jp',
        '5f4dcc3b5aa765d61d8327deb882cf99', 90),
       ('kjeeks2', 'Barrows-Heller',
        'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.',
        'pbilbrooke2@cisco.com', '5f4dcc3b5aa765d61d8327deb882cf99', 90),
       ('cfulleylove3', 'Waelchi-Zboncak',
        'Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.',
        'ghayes3@goodreads.com', '5f4dcc3b5aa765d61d8327deb882cf99', 90),
       ('jmcaughtrie4', 'Graham, Lemke and Mann',
        'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl.',
        'nbedham4@goodreads.com', '5f4dcc3b5aa765d61d8327deb882cf99', 90),
       ('rivakhno5', 'Cummerata, McKenzie and Moore',
        'Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.',
        'cguerreiro5@feedburner.com', '5f4dcc3b5aa765d61d8327deb882cf99', 90),
       ('lhollyland6', 'Durgan-Kovacek',
        'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.',
        'ajaggers6@cnn.com', '5f4dcc3b5aa765d61d8327deb882cf99', 90);


INSERT INTO jobpost (Location, vacancy, Iplace, Deadline, salary, Title, Boosted, About, requirement, type, comid)
VALUES ('Dolpa', 24, 'Okhaldhunga', '26/01/2024', 449081, 'Geologist IV', 10,
        'ut vehicula velit hendrerit semper. Nullam nec leo ex.',
        'venenatis tincidunt sem lacinia Duis porta mi non ipsum fringilla mattis Fusce quis est elementum',
        'Internship', 2),
       ('Baglung', 33, 'Rukum', '25/10/2023', 170408, 'Human Resources Manager', 20,
        'egestas eget nisl. Sed in volutpat lectus. Mauris laoreet a magna a euismod.',
        'congue nulla Nulla at purus nec mauris condimentum placerat', 'Temporary', 1),
       ('Dhanusa', 47, 'Jumla', '11/12/2023', 448006, 'Sales Associate', 10, 'urna nisl mollis ante',
        'pretium velit ac', 'Full-Time', 2),
       ('Ramechhap', 31, 'Rolpa', '01/08/2023', 395146, 'Legal Assistant', 20,
        'Donec condimentum vitae metus in dictum. Fusce tristique malesuada enim a rutrum. Integer convallis nisi nec ultricies venenatis. Aenean porta dolor interdum purus imperdiet imperdiet. Proin finibus',
        'Sed sed justo venenatis', 'Full-Time', 3),
       ('Tanahu', 36, 'Taplejung', '13/09/2023', 435120, 'General Manager', 30, 'efficitur in sapien non',
        'Maecenas sed lorem ac erat fermentum commodo eget volutpat velit Quisque suscipit ligula sed leo convallis mollis Donec malesuada dolor sit amet libero aliquam',
        'Internship', 1),
       ('Kalikot', 18, 'Arghakhanchi', '19/08/2023', 429250, 'Nurse Practicioner', 30,
        'ut facilisis massa orci ac ante. Etiam sollicitudin volutpat nibh',
        'fermentum dolor Suspendisse eu mi hendrerit', 'Full-Time', 4),
       ('Surkhet', 13, 'Morang', '05/01/2024', 482082, 'Sales Associate', 30, 'porta interdum magna. Nullam mattis',
        'rutrum ultricies tortor congue', 'Temporary', 6),
       ('Syangja', 29, 'Dhanusa', '20/12/2023', 155820, 'Internal Auditor', 30,
        'accumsan pellentesque nunc. Aliquam elementum interdum porttitor. Maecenas purus nisi',
        'scelerisque orci Etiam ut magna placerat', 'Full-Time', 2),
       ('Salyan', 13, 'Dhading', '25/08/2023', 258143, 'Health Coach IV', 10,
        'egestas eget nisl. Sed in volutpat lectus. Mauris laoreet a magna a euismod.', 'quis fermentum orci tincidunt',
        'Part-Time', 3),
       ('Siraha', 22, 'Doti', '28/06/2024', 191230, 'Research Associate', 30, 'velit lorem rutrum sapien',
        'fermentum dolor Suspendisse eu mi hendrerit', 'Internship', 2),
       ('Myagdi', 14, 'Dang Deukhuri', '08/11/2023', 212856, 'Director of Sales', 30, 'urna nisl mollis ante',
        'tincidunt tortor Nunc et ex dictum', 'Temporary', 6),
       ('Morang', 49, 'Gorkha', '15/08/2023', 194544, 'VP Marketing', 10, 'Cras ipsum ex',
        'quis fermentum orci tincidunt', 'Full-Time', 4),
       ('Okhaldhunga', 46, 'Baglung', '27/11/2023', 48995, 'Human Resources Assistant II', 10,
        'ut facilisis massa orci ac ante. Etiam sollicitudin volutpat nibh', 'blandit ligula quis', 'Full-Time', 3),
       ('Salyan', 29, 'Rupandehi', '11/08/2023', 335511, 'Human Resources Manager', 20,
        'consectetur turpis. Vivamus in posuere dolor', 'non posuere ligula ullamcorper', 'Part-Time', 3),
       ('Dadeldhura', 30, 'Makwanpur', '03/12/2023', 31304, 'Analyst Programmer', 10,
        'eget faucibus augue diam non nibh. Nunc augue mi',
        'Donec vel diam et neque rhoncus varius Aliquam at risus efficitur', 'Full-Time', 3),
       ('Dang Deukhuri', 20, 'Surkhet', '10/01/2024', 497312, 'Account Representative I', 30, 'congue eu placerat ut',
        'feugiat augue', 'Part-Time', 1),
       ('Salyan', 21, 'Rolpa', '31/03/2024', 125700, 'Desktop Support Technician', 10, 'Etiam nec leo pellentesque',
        'Donec non nulla nec velit tincidunt vehicula Nulla tempor lectus ut sapien placerat scelerisque Aliquam semper lorem in justo accumsan hendrerit',
        'Part-Time', 5),
       ('Tanahu', 29, 'Jhapa', '01/07/2024', 228440, 'Research Assistant I', 30,
        'pharetra quis justo. Praesent vitae metus id nibh interdum placerat non et tellus. Nulla elementum efficitur mi',
        'pretium velit ac', 'Full-Time', 3),
       ('Arghakhanchi', 29, 'Dailekh', '07/10/2023', 253705, 'Financial Advisor', 10,
        'ut luctus nibh viverra dapibus. Donec feugiat leo nec velit ultricies',
        'fermentum dolor Suspendisse eu mi hendrerit', 'Part-Time', 4),
       ('Achham', 39, 'Nawalparasi', '05/02/2024', 285151, 'VP Quality Control', 10, 'interdum at nulla.',
        'Donec non nulla nec velit tincidunt vehicula Nulla tempor lectus ut sapien placerat scelerisque Aliquam semper lorem in justo accumsan hendrerit',
        'Internship', 4);