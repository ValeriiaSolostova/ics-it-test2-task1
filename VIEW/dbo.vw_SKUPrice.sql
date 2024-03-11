create view dbo.vw_SKUWithPrice 
as 
select 
  s.*
  ,dbo.udf_GetSKUPrice(s.ID) AS SKUPrice
from dbo.SKU s;
