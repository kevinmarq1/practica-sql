create function keepcoding.int_cleaner(imput int64)
returns int64
as(ifnull(imput,-99999));
