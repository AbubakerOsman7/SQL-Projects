
CREATE TABLE STUDENT (
   StudentID INTEGER PRIMARY KEY,
   FirstName VARCHAR(20) NOT NULL,
   LastName VARCHAR(20) NOT NULL,
   Email VARCHAR(20) NOT NULL
);

CREATE TABLE SUBJECT (
   SubjectID VARCHAR(10) PRIMARY KEY,
   SubjectName VARCHAR(20) NOT NULL,
   Semester VARCHAR(1) NOT NULL,
   SubjectLevel VARCHAR(1) NOT NULL,
   CreditValue INTEGER NOT NULL 
);

CREATE TABLE COURSEWORK (
   CourseworkID VARCHAR(5) PRIMARY KEY,
   MaximumMark INTEGER NOT NULL
);

CREATE TABLE EXAM (
   ExamID INTEGER PRIMARY KEY,
   SubjectID VARCHAR(10) NOT NULL,
   ExamName VARCHAR(50) NOT NULL,
   ExamDate DATE NOT NULL,
      CONSTRAINT SubjectForeign FOREIGN KEY (SubjectID)
      REFERENCES SUBJECT(SubjectID) ON DELETE CASCADE
);

CREATE TABLE LECTURER (
   LecturerID INTEGER PRIMARY KEY,
   LecFName VARCHAR(15) NOT NULL,
   LecLName VARCHAR(15) NOT NULL
);

CREATE TABLE QUESTION (
   QuestionID INTEGER PRIMARY KEY,
   MarkedBy INTEGER NOT NULL,
   MaximumMark INTEGER NOT NULL,
      CONSTRAINT LecturerForeign FOREIGN KEY (MarkedBy)
      REFERENCES LECTURER(LecturerID) ON DELETE CASCADE
);

CREATE TABLE STUDENTENROLSSUBJECT (
  StudentID INTEGER,
  SubjectID VARCHAR(10),
  Year INTEGER NOT NULL,
  PRIMARY KEY(StudentID, SubjectID),
      CONSTRAINT StudentForeign FOREIGN KEY (StudentID)
      REFERENCES STUDENT(StudentID) ON DELETE CASCADE,
      CONSTRAINT SubjectForeignInEnrol FOREIGN KEY (SubjectID)
      REFERENCES SUBJECT(SubjectID) ON DELETE CASCADE
);

CREATE TABLE COURSEWORKFORSUBJECT (
  CourseworkID VARCHAR(5),
  SubjectID VARCHAR(10),
  PRIMARY KEY(CourseworkID, SubjectID),
     CONSTRAINT CourseworkForeign FOREIGN KEY (CourseworkID)
     REFERENCES COURSEWORK(CourseworkID) ON DELETE CASCADE,
     CONSTRAINT SubjectForeignInCoursework FOREIGN KEY (SubjectID)
     REFERENCES SUBJECT(SubjectID) ON DELETE CASCADE
);

CREATE TABLE STUDENTDOESCOURSEWORK (
   StudentID INTEGER,
   CourseworkID VARCHAR(5),
   Mark INTEGER NOT NULL,
   PRIMARY KEY(StudentID, CourseworkID),
      CONSTRAINT StudentForeignInCoursework FOREIGN KEY (StudentID)
      REFERENCES STUDENT(StudentID) ON DELETE CASCADE,
      CONSTRAINT CourseworkForeign2 FOREIGN KEY (CourseworkID)
      REFERENCES COURSEWORK(CourseworkID) ON DELETE CASCADE
);

CREATE TABLE STUDENTTAKESEXAM (
   StudentID INTEGER,
   ExamID INTEGER,
   Attempt INTEGER NOT NULL,
   PRIMARY KEY(StudentID, ExamID),
      CONSTRAINT StudentForeignInExam FOREIGN KEY (StudentID)
      REFERENCES STUDENT(StudentID) ON DELETE CASCADE,
      CONSTRAINT ExamForeign FOREIGN KEY (ExamID)
      REFERENCES EXAM(ExamID) ON DELETE CASCADE
);

CREATE TABLE LECTURERSETSEXAM (
  LecturerID INTEGER,
  ExamID INTEGER,
  PRIMARY KEY(LecturerID, ExamID),
     CONSTRAINT LecturerForeignInExam FOREIGN KEY (LecturerID)
     REFERENCES LECTURER(LecturerID) ON DELETE CASCADE,
     CONSTRAINT ExamForeignInSetExam FOREIGN KEY (ExamID)
     REFERENCES EXAM(ExamID) ON DELETE CASCADE
);

CREATE TABLE QUESTIONFOREXAM (
  QuestionID INTEGER,
  ExamID INTEGER,
  PRIMARY KEY (QuestionID, ExamID),
     CONSTRAINT QuestionForeignInExam FOREIGN KEY (QuestionID)
     REFERENCES QUESTION(QuestionID) ON DELETE CASCADE,
     CONSTRAINT ExamForeignInQuesForExam FOREIGN KEY (ExamID)
     REFERENCES EXAM(ExamID) ON DELETE CASCADE
);

CREATE TABLE STUDENTDOESQUESTION (
   StudentID INTEGER,
   QuestionID INTEGER,
   Mark INTEGER NOT NULL,
   PRIMARY KEY(StudentID, QuestionID),
      CONSTRAINT StudentForeignInQuestion FOREIGN KEY (StudentID)
      REFERENCES STUDENT(StudentID) ON DELETE CASCADE,
      CONSTRAINT QuestionForeign FOREIGN KEY (QuestionID)
      REFERENCES QUESTION(QuestionID) ON DELETE CASCADE
);