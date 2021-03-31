CREATE TABLE room (
  id  int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name  varchar(50) NOT NULL,
  --si es laboratorio es 1 o 0 si no lo es
  lab bit NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE course (
    id INT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    uuid varchar (16) NOT NULL,
    name VARCHAR(255) NOT NULL,
    keycode VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE INDEX course_uuid_uk(uuid)
)  ENGINE=INNODB;


CREATE table grade(
  id int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  uuid varchar (16) NOT NULL,
  cal int(2) NOT NULL,
  fechaReg date not NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX grade_uuid_uk(uuid)

)ENGINE=InnoDB
CREATE TABLE teacher (
  id  int(20) UNSIGNED NOT NULL AUTO_INCREMENT ,
  uuid  varchar(16) NOT NULL ,
  name  varchar(50) NOT NULL ,
  first_surname  varchar(50) NOT NULL ,
  second_surname varchar(50) Not NULL ,
  PRIMARY KEY (id),
  UNIQUE INDEX teacher_uuid_uk (uuid)
) ENGINE=InnoDB;

CREATE TABLE teacher_role (
  id  int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name  varchar(255) NOT NULL,
  teacher_id  int(20) UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT teacher_role_teacher_id_fk FOREIGN KEY (teacher_id)
   REFERENCES teacher (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE course_teacher (
  id  int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  course_id  int(20) UNSIGNED NOT NULL,
  teacher_id  int(20) UNSIGNED NOT NULL,
  room_id  int(20) UNSIGNED NOT NULL,
  start_time time NOT NULL,
  end_time time NOT NULL,
  day date NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT course_teacher_teacher_id_fk FOREIGN KEY (teacher_id) REFERENCES teacher (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT course_teacher_course_id_fk FOREIGN KEY (course_id) REFERENCES course (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT course_teacher_room_id_fk FOREIGN KEY (room_id) REFERENCES room (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE student (
  id int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  uuid varchar(16) NOT NULL,
  name  varchar(50) NOT NULL,
  first_surname  varchar(50) NOT NULL,
  second_surname  varchar(50) NOT NULL,
  birthday date NOT NULL,
  course_teacher_id int(20) UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT student_course_teacher_id_fk FOREIGN KEY (course_teacher_id) REFERENCES course_teacher (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
