#### Preamble ####
# Purpose: Cleans the raw data from https://jacobfilipp.com/hammer/
# Author: Doran Wang
# Date: 14 Nov. 2024
# Contact: doran.wang@mail.utoronto.ca
# License: None
# Pre-requisites: download the dataset hammer-2-processed.sqlite
# Any other information needed? using the code in DB Browser for SQLite

CREATE TABLE clean_data AS 
SELECT 
    p.id AS product_id,
    p.vendor AS product_vendor, 
	p.product_name AS product_name,
	r.other AS other,
    r.current_price AS current_price,
	r.old_price AS old_price,
	r.nowtime AS nowtime
FROM 
    product p
JOIN 
    raw r 
    ON p.id = r.product_id
WHERE 
    r.current_price IS NOT NULL
    AND r.product_id IN (67188, 31508);
