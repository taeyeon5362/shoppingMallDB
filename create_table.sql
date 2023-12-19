CREATE TABLE member(
  id VARCHAR2(20) NOT NULL,
  password VARCHAR2(20) NOT NULL,
  name VARCHAR2(10) NOT NULL,
  age INT,
  job VARCHAR2(20),
  grade VARCHAR2(20) NOT NULL,
  reward INT NOT NULL,
  CONSTRAINT member_pk PRIMARY KEY(id)
);

CREATE TABLE product(
  pid VARCHAR2(20) NOT NULL,
  pname VARCHAR2(20) NOT NULL,
  pnum INT NOT NULL,
  pprice INT NOT NULL,
  dname VARCHAR2(10),
  ddate VARCHAR2(20) NOT NULL,
  dnum INT NOT NULL,
  CONSTRAINT product_pk PRIMARY KEY(Pid),
  CONSTRAINT product_fk FOREIGN KEY(dname) REFERENCES delivery(dname)
);

CREATE TABLE delivery(
  dname VARCHAR2(20) NOT NULL,
  dnumber VARCHAR2(20) NOT NULL,
  dloc VARCHAR2(50) NOT NULL,
  dmanager VARCHAR2(10) NOT NULL,
  CONSTRAINT delivery_pk PRIMARY KEY(dname)
);

CREATE TABLE qna(
  postid VARCHAR2(20) NOT NULL,
  postname VARCHAR2(20) NOT NULL,
  postdetail VARCHAR2(100) NOT NULL,
  postdate VARCHAR2(20) NOT NULL,
  id VARCHAR2(20) NOT NULL,
  CONSTRAINT qna_pk PRIMARY KEY(postid),
  CONSTRAINT qna_fk FOREIGN KEY(id) REFERENCES member(id)
);

CREATE TABLE “order”(
  id VARCHAR2(20) NOT NULL,
  pid VARCHAR2(20) NOT NULL,
  oid VARCHAR2(10) NOT NULL,
  onum INT NOT NULL,
  delloc VARCHAR2(20) NOT NULL,
  dedate VARCHAR2(20) NOT NULL,
  CONSTRAINT order_pk PRIMARY KEY(id, pid),
  CONSTRAINT order_fk FOREIGN KEY(id) REFERENCES member(id),
  CONSTRAINT order_fk FOREIGN KEY(pid) REFERENCES product(pid)
);
-- order은 예약 어이므로 테이블 이름을 사용하기 위해서 큰따옴표 사용
