CREATE OR REPLACE TRIGGER decrease_product_stock
AFTER INSERT ON "order"
FOR EACH ROW
BEGIN
 -- 상품 재고 감소
 UPDATE product
 SET pnum = pnum - :NEW.onum
 WHERE pid = :NEW.pid;
END;
