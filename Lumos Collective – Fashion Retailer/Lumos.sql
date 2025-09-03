SELECT      CustomerID, 
            FirstName, 
            LastName,
            Email,
            Email_Consent,
            Status,
            PreferredCategory,
            LastPurchaseDate,
            LastBrowseDate,
            CASE 
               WHEN LastBrowseDate >= DATEADD(D, -7, GETDATE()) THEN 'Hot'
               WHEN LastBrowseDate >= DATEADD(D, -14, GETDATE()) THEN 'Warm' 
               ELSE 'Cold' 
            END AS SaleUrgency
FROM        [Customer_Profile]
WHERE       Status = 'Active'
AND         Email_Consent = 'True'
AND         (
              ((LastPurchaseDate >= DATEADD(D, -180, GETDATE()) OR LastPurchaseDate IS NULL)
              AND PreferredCategory IN ('Shoes', 'Bags'))
            OR 
            (LastBrowseDate >= DATEADD(D, -14, GETDATE()) OR LastBrowseDate IS NULL )
             )
            