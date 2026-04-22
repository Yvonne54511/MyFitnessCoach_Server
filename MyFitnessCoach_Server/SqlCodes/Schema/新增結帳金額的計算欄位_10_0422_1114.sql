ALTER TABLE ProductOrders
ADD FinalAmount AS (OriginalAmount - DiscountAmount);