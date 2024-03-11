create procedure dbo.usp_MakeFamilyPurchase
	@FamilySurName varchar(255)
as
begin
  set noncount on;
  -- Проверка существования семьи
  if not exists (select 1 from dbo.Family where SurName = @FamilySurName)
  begin
    raiserror('Семьи с такой фамилией не существует.', 16, 1);
    return;
  end;
	
  -- Обновление BudgetValue в таблице dbo.Family
  update dbo.Family
  set BudgetValue = f.BudgetValue - isnull((select sum(b.Value) from dbo.Basket b where b.ID_Family = f.ID), 0)
  from dbo.Family f
  where f.SurName = @FamilySurName
end;
