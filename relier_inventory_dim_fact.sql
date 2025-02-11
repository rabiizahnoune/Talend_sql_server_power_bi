alter table [dbo].[invetory_fact]
add constraint fk_inventory_customer foreign key (customer_key) references [dbo].[customer_dim](customer_key);

alter table [dbo].[invetory_fact]
add constraint fk_inventory_product foreign key (product_key_cat) references [dbo].[dim_product](product_key_cat);

alter table [dbo].[invetory_fact]
add constraint fk_inventory_date foreign key (Date_key) references [dbo].[dim_date](date_key);

alter table [dbo].[invetory_fact]
add constraint fk_inventory_suppier foreign key (suppier_key) references [dbo].[supplier_dim](supplier_key);


