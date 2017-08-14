DROP TABLE QUEUE_LOGS CASCADE CONSTRAINTS;
DROP TABLE QUEUE_AWAITERS CASCADE CONSTRAINTS;
DROP TABLE INGREDIENT_DETAILS CASCADE CONSTRAINTS;
DROP TABLE INGREDIENT_CATEGORIES CASCADE CONSTRAINTS;
DROP TABLE STORE_DATA CASCADE CONSTRAINTS;
DROP TABLE PRODUCT_INGREDIENTS CASCADE CONSTRAINTS;
DROP TABLE INGREDIENT CASCADE CONSTRAINTS;
DROP TABLE ORDERS CASCADE CONSTRAINTS;
DROP TABLE TABLES CASCADE CONSTRAINTS;
DROP TABLE PRODUCTS CASCADE CONSTRAINTS;
DROP TABLE PRODUCT_CATEGORIES CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 상품카테고리 */
/**********************************/
CREATE TABLE PRODUCT_CATEGORIES(
		PDCT_ID                       		NUMBER(6)		 NULL ,
		PDCT_NAME                     		VARCHAR2(20)		 NOT NULL
);

COMMENT ON TABLE PRODUCT_CATEGORIES is '상품카테고리';
COMMENT ON COLUMN PRODUCT_CATEGORIES.PDCT_ID is '상품카테고리번호';
COMMENT ON COLUMN PRODUCT_CATEGORIES.PDCT_NAME is '상품카테고리명';


/**********************************/
/* Table Name: 상품 */
/**********************************/
CREATE TABLE PRODUCTS(
		PDT_ID                        		NUMBER(6)		 NULL ,
		PDT_NAME                      		VARCHAR2(30)		 NOT NULL,
		PDT_PRICE                     		NUMBER(6)		 NOT NULL,
		PDT_IMGSRC_L                  		VARCHAR2(30)		 NULL ,
		PDT_IMGSRC_S                  		VARCHAR2(30)		 NULL ,
		PDT_DESCRIPTION               		VARCHAR2(400)		 NULL ,
		PDCT_ID                       		NUMBER(6)		 NULL 
);

COMMENT ON TABLE PRODUCTS is '상품';
COMMENT ON COLUMN PRODUCTS.PDT_ID is '상품번호';
COMMENT ON COLUMN PRODUCTS.PDT_NAME is '상품명';
COMMENT ON COLUMN PRODUCTS.PDT_PRICE is '상품가격';
COMMENT ON COLUMN PRODUCTS.PDT_IMGSRC_L is '상품큰이미지경로';
COMMENT ON COLUMN PRODUCTS.PDT_IMGSRC_S is '상품작은이미지경로';
COMMENT ON COLUMN PRODUCTS.PDT_DESCRIPTION is '상품설명';
COMMENT ON COLUMN PRODUCTS.PDCT_ID is '상품카테고리번호';


/**********************************/
/* Table Name: 테이블 */
/**********************************/
CREATE TABLE TABLES(
		TBL_ID                        		NUMBER(3)		 NULL ,
		TBL_IS_EMPTY                  		CHAR(1)		 DEFAULT 'Y'		 NOT NULL
);

COMMENT ON TABLE TABLES is '테이블';
COMMENT ON COLUMN TABLES.TBL_ID is '테이블번호';
COMMENT ON COLUMN TABLES.TBL_IS_EMPTY is '공석여부';


/**********************************/
/* Table Name: 주문정보 */
/**********************************/
CREATE TABLE ORDERS(
		ORD_ID                        		NUMBER(6)		 NULL ,
		PDT_ID                        		NUMBER(6)		 NOT NULL,
		ORD_PDT_AMOUNT                		NUMBER(2)		 DEFAULT 1		 NOT NULL,
		ORD_TOTAL                     		NUMBER(6)		 NOT NULL,
		ORD_PAYMENT_METHOD            		VARCHAR2(20)		 NOT NULL,
		ORD_DATE                      		DATE		 DEFAULT SYSDATE		 NOT NULL,
		ORD_STATE                     		CHAR(1)		 DEFAULT 'B'		 NOT NULL,
		TBL_ID                        		NUMBER(3)		 NULL 
);

COMMENT ON TABLE ORDERS is '주문정보';
COMMENT ON COLUMN ORDERS.ORD_ID is '주문번호';
COMMENT ON COLUMN ORDERS.PDT_ID is '상품번호';
COMMENT ON COLUMN ORDERS.ORD_PDT_AMOUNT is '주문상품수량';
COMMENT ON COLUMN ORDERS.ORD_TOTAL is '주문금액';
COMMENT ON COLUMN ORDERS.ORD_PAYMENT_METHOD is '결제수단';
COMMENT ON COLUMN ORDERS.ORD_DATE is '주문일시';
COMMENT ON COLUMN ORDERS.ORD_STATE is '주문상태';
COMMENT ON COLUMN ORDERS.TBL_ID is '테이블번호';


/**********************************/
/* Table Name: 재료 */
/**********************************/
CREATE TABLE INGREDIENT(
		ING_ID                        		NUMBER(6)		 NULL ,
		ING_NAME                      		VARCHAR2(20)		 NOT NULL,
		ING_STOCK                     		NUMBER(6)		 DEFAULT 0		 NOT NULL,
		ING_MEASURE                   		VARCHAR2(2)		 NOT NULL
);

COMMENT ON TABLE INGREDIENT is '재료';
COMMENT ON COLUMN INGREDIENT.ING_ID is '재료번호';
COMMENT ON COLUMN INGREDIENT.ING_NAME is '재료명';
COMMENT ON COLUMN INGREDIENT.ING_STOCK is '재료재고량';
COMMENT ON COLUMN INGREDIENT.ING_MEASURE is '재료재고단위';


/**********************************/
/* Table Name: 상품재료정보 */
/**********************************/
CREATE TABLE PRODUCT_INGREDIENTS(
		PDT_ID                        		NUMBER(6)		 NULL ,
		ING_ID                        		NUMBER(6)		 NULL ,
		PDIG_AMOUNT                   		NUMBER(6)		 NOT NULL
);

COMMENT ON TABLE PRODUCT_INGREDIENTS is '상품재료정보';
COMMENT ON COLUMN PRODUCT_INGREDIENTS.PDT_ID is '상품번호';
COMMENT ON COLUMN PRODUCT_INGREDIENTS.ING_ID is '재료번호';
COMMENT ON COLUMN PRODUCT_INGREDIENTS.PDIG_AMOUNT is '재료수량';


/**********************************/
/* Table Name: 매장정보 */
/**********************************/
CREATE TABLE STORE_DATA(
		STDT_ADMIN_PIN                		NUMBER(6)		 DEFAULT 000000		 NOT NULL,
		STDT_CAPACITY                 		NUMBER(3)		 NULL ,
		STDT_REST                     		NUMBER(3)		 NULL ,
		STDT_WAITING                  		NUMBER(2)		 DEFAULT 0		 NULL 
);

COMMENT ON TABLE STORE_DATA is '매장정보';
COMMENT ON COLUMN STORE_DATA.STDT_ADMIN_PIN is '관리자PIN';
COMMENT ON COLUMN STORE_DATA.STDT_CAPACITY is '전체좌석수';
COMMENT ON COLUMN STORE_DATA.STDT_REST is '잔여좌석수';
COMMENT ON COLUMN STORE_DATA.STDT_WAITING is '대기인원수';


/**********************************/
/* Table Name: 재료카테고리 */
/**********************************/
CREATE TABLE INGREDIENT_CATEGORIES(
		IGCT_ID                       		NUMBER(6)		 NULL ,
		IGCT_NAME                     		VARCHAR2(20)		 NOT NULL
);

COMMENT ON TABLE INGREDIENT_CATEGORIES is '재료카테고리';
COMMENT ON COLUMN INGREDIENT_CATEGORIES.IGCT_ID is '재고카테고리번호';
COMMENT ON COLUMN INGREDIENT_CATEGORIES.IGCT_NAME is '재료카테고리명';


/**********************************/
/* Table Name: 재료정보 */
/**********************************/
CREATE TABLE INGREDIENT_DETAILS(
		ING_ID                        		NUMBER(6)		 NULL ,
		IGDT_IN                       		DATE		 DEFAULT SYSDATE		 NOT NULL,
		IGDT_OUT                      		DATE		 DEFAULT SYSDATE		 NOT NULL,
		IGDT_PRICE                    		NUMBER(6)		 NOT NULL,
		IGDT_CONTACT                  		VARCHAR2(16)		 NULL ,
		IGCT_ID                       		NUMBER(6)		 NULL 
);

COMMENT ON TABLE INGREDIENT_DETAILS is '재료정보';
COMMENT ON COLUMN INGREDIENT_DETAILS.ING_ID is '재료번호';
COMMENT ON COLUMN INGREDIENT_DETAILS.IGDT_IN is '재료입고일시';
COMMENT ON COLUMN INGREDIENT_DETAILS.IGDT_OUT is '재료출고일시';
COMMENT ON COLUMN INGREDIENT_DETAILS.IGDT_PRICE is '재료단가';
COMMENT ON COLUMN INGREDIENT_DETAILS.IGDT_CONTACT is '거래처연락처';
COMMENT ON COLUMN INGREDIENT_DETAILS.IGCT_ID is '재고카테고리번호';


/**********************************/
/* Table Name: 대기자정보 */
/**********************************/
CREATE TABLE QUEUE_AWAITERS(
		QAWT_ID                       		NUMBER(6)		 NULL ,
		QAWT_CONTACT                  		VARCHAR2(16)		 NULL 
);

COMMENT ON TABLE QUEUE_AWAITERS is '대기자정보';
COMMENT ON COLUMN QUEUE_AWAITERS.QAWT_ID is '대기자번호';
COMMENT ON COLUMN QUEUE_AWAITERS.QAWT_CONTACT is '대기자연락처';


/**********************************/
/* Table Name: 대기로그 */
/**********************************/
CREATE TABLE QUEUE_LOGS(
		QLOG_ID                       		NUMBER(6)		 NULL ,
		QLOG_RECORD                   		DATE		 DEFAULT SYSDATE		 NOT NULL,
		QAWT_ID                       		NUMBER(6)		 NULL 
);

COMMENT ON TABLE QUEUE_LOGS is '대기로그';
COMMENT ON COLUMN QUEUE_LOGS.QLOG_ID is '대기번호';
COMMENT ON COLUMN QUEUE_LOGS.QLOG_RECORD is '대기발생일시';
COMMENT ON COLUMN QUEUE_LOGS.QAWT_ID is '대기자번호';



ALTER TABLE PRODUCT_CATEGORIES ADD CONSTRAINT IDX_PRODUCT_CATEGORIES_PK PRIMARY KEY (PDCT_ID);

ALTER TABLE PRODUCTS ADD CONSTRAINT IDX_PRODUCTS_PK PRIMARY KEY (PDT_ID);
ALTER TABLE PRODUCTS ADD CONSTRAINT IDX_PRODUCTS_FK0 FOREIGN KEY (PDCT_ID) REFERENCES PRODUCT_CATEGORIES (PDCT_ID);

ALTER TABLE TABLES ADD CONSTRAINT IDX_TABLES_PK PRIMARY KEY (TBL_ID);

ALTER TABLE ORDERS ADD CONSTRAINT IDX_ORDERS_PK PRIMARY KEY (ORD_ID);
ALTER TABLE ORDERS ADD CONSTRAINT IDX_ORDERS_FK0 FOREIGN KEY (PDT_ID) REFERENCES PRODUCTS (PDT_ID);
ALTER TABLE ORDERS ADD CONSTRAINT IDX_ORDERS_FK1 FOREIGN KEY (TBL_ID) REFERENCES TABLES (TBL_ID);

ALTER TABLE INGREDIENT ADD CONSTRAINT IDX_INGREDIENT_PK PRIMARY KEY (ING_ID);

ALTER TABLE PRODUCT_INGREDIENTS ADD CONSTRAINT IDX_PRODUCT_INGREDIENTS_PK PRIMARY KEY (PDT_ID, ING_ID);
ALTER TABLE PRODUCT_INGREDIENTS ADD CONSTRAINT IDX_PRODUCT_INGREDIENTS_FK0 FOREIGN KEY (ING_ID) REFERENCES INGREDIENT (ING_ID);
ALTER TABLE PRODUCT_INGREDIENTS ADD CONSTRAINT IDX_PRODUCT_INGREDIENTS_FK1 FOREIGN KEY (PDT_ID) REFERENCES PRODUCTS (PDT_ID);

ALTER TABLE INGREDIENT_CATEGORIES ADD CONSTRAINT IDX_INGREDIENT_CATEGORIES_PK PRIMARY KEY (IGCT_ID);

ALTER TABLE INGREDIENT_DETAILS ADD CONSTRAINT IDX_INGREDIENT_DETAILS_PK PRIMARY KEY (ING_ID);
ALTER TABLE INGREDIENT_DETAILS ADD CONSTRAINT IDX_INGREDIENT_DETAILS_FK0 FOREIGN KEY (IGCT_ID) REFERENCES INGREDIENT_CATEGORIES (IGCT_ID);
ALTER TABLE INGREDIENT_DETAILS ADD CONSTRAINT IDX_INGREDIENT_DETAILS_FK1 FOREIGN KEY (ING_ID) REFERENCES INGREDIENT (ING_ID);

ALTER TABLE QUEUE_AWAITERS ADD CONSTRAINT IDX_QUEUE_AWAITERS_PK PRIMARY KEY (QAWT_ID);

ALTER TABLE QUEUE_LOGS ADD CONSTRAINT IDX_QUEUE_LOGS_PK PRIMARY KEY (QLOG_ID);
ALTER TABLE QUEUE_LOGS ADD CONSTRAINT IDX_QUEUE_LOGS_FK0 FOREIGN KEY (QAWT_ID) REFERENCES QUEUE_AWAITERS (QAWT_ID);

