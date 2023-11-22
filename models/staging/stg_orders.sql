select
    -- from raw orders
    ord.orderid,
    ord.orderdate,
    ord.shipdate,
    ord.shipmode,
    ord.ordercostprice,
    ord.ordersellingprice,
    ord.ordersellingprice - ord.ordercostprice as orderprofit,
    -- from raw_customer
    cus.customerid,
    cus.customername,
    cus.segment,
    cus.country,
    -- from raw_product
    pro.productid,
    pro.category,
    pro.productname,
    pro.subcategory
from {{ ref('raw_orders') }} as ord
left join {{ ref('raw_customer') }} as cus
on ord.customerid = cus.customerid
left join {{ ref('raw_product') }} as pro
on ord.productid = pro.productid