create trigger dbo.TR_Basket_insert_update on dbo.Basket
after insert, update
as
begin
set noncount on;
	
  update b
  set DiscountValue = case
                        -- Так как в таблице Basket допускается, что столбец ID_SKU может иметь null значения, введем условие is not null 
                        when b.ID_SKU is not null 
                            and (select count(*) from inserted i where i.ID_SKU = b.ID_SKU) >= 2 
                          then b.Value * 0.05
                        else 0
                      end
from dbo.Basket b
  inner join inserted i on i.ID = b.ID;
end;
