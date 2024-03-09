create function dbo.udf_GetSKUPrice(
  @ID_SKU int
)
returns decimal(18,2)
as 
begin 
  declare @udf_GetSKUPrice decimal(18,2);
  select @udf_GetSKUPrice = sum(Value)/nullif(sum(Quantity),0)
  from dbo.Basket
  where ID_SKU = @ID_SKU;
  -- Вернем тестовое сообщение об ошибке вместо null
  return isnull(@udf_GetSKUPrice, 'Ошибка при выполнении функции');
end;
