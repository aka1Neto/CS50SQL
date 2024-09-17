CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(128) NOT NULL
);

CREATE TABLE schools_universities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    type TEXT NOT NULL,
    location TEXT NOT NULL,
    year_founded INT CHECK (LENGTH(year_founded) = 3)
);

CREATE TABLE companies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    industry TEXT NOT NULL,
    location TEXT NOT NULL
);

CREATE TABLE users_connection (
    id INT AUTO_INCREMENT PRIMARY KEY,
    follower_id INT NOT NULL,
    followed_id INT NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followed_id) REFERENCES users(id),
    CONSTRAINT user_connection UNIQUE (follower_id, followed_id)
);

CREATE TABLE schools_connection (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    school_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    degree TEXT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES users(id),
    FOREIGN KEY (school_id) REFERENCES schools_universities(id),
    CONSTRAINT school_connection UNIQUE (student_id, school_id)
);

CREATE TABLE companies_connection (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    company_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    title TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (company_id) REFERENCES companies(id),
    CONSTRAINT company_connection UNIQUE (user_id, company_id)
);
