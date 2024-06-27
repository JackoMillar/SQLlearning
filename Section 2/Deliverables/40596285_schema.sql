CREATE TABLE ratings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,

    quality INT(1),
    delivery INT(1),
    satisfaction INT(1),

    quality_review VARCHAR(255),
    delivery_review VARCHAR(255),
    satisfaction_review VARCHAR(255),

    FOREIGN KEY (order_id) REFERENCES orders(id),

    CHECK (order_id IS NOT NULL),
    CHECK ((quality IS NOT NULL OR quality_review IS NULL) AND quality BETWEEN 0 AND 5),
    CHECK ((delivery IS NOT NULL OR delivery_review IS NULL) AND delivery BETWEEN 0 AND 5),
    CHECK ((satisfaction IS NOT NULL OR satisfaction_review IS NULL) AND satisfaction BETWEEN 0 AND 5)
);

	
INSERT INTO ratings (order_id, quality, delivery)
VALUES (66, 2, 1);

INSERT INTO ratings (order_id, satisfaction, satisfaction_review)
VALUES (67, 5, 'not satisfied'); 

INSERT INTO ratings (order_id, quality, satisfaction, delivery, quality_review, satisfaction_review, delivery_review)
VALUES (75,1,1,1, 'alright', 'good', 'decent');


INSERT INTO ratings (order_id, quality, satisfaction, delivery)
VALUES (68, 5, 3 , 1);

INSERT INTO ratings (order_id, quality)
VALUES (70, 5);

INSERT INTO ratings (order_id)
VALUES (69);

INSERT INTO ratings (order_id, quality, satisfaction, delivery)
VALUES (35000, 1, 2, 4);

INSERT INTO ratings (order_id, quality, satisfaction, delivery)
VALUES (44743, 5, 3, 1);

INSERT INTO ratings (order_id, quality, satisfaction, delivery)
VALUES (88328, 2, 5, 2);

INSERT INTO ratings (order_id, quality, satisfaction, delivery)
VALUES (14525, 1, 1, 1);