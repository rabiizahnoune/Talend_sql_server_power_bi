-- Masquage des emails (affiche uniquement la premi�re lettre et le domaine)
ALTER TABLE customer_dim 
ALTER COLUMN CustomerEmail ADD MASKED WITH (FUNCTION = 'email()');

-- Masquage des num�ros de t�l�phone (remplace tous les chiffres sauf les deux extr�mes)
ALTER TABLE customer_dim 
ALTER COLUMN CustomerPhone ADD MASKED WITH (FUNCTION = 'partial(2,"XXXXXXX",2)');

ALTER TABLE customer_dim 
ALTER COLUMN customerName ADD MASKED WITH (FUNCTION = 'partial(1, "XXXXX", 0)');


