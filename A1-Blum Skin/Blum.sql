SELECT       SubscriberKey, 
             UPPER(LEFT(FirstName, 1)) + LOWER(RIGHT(FirstName, LEN(FirstName) -1)) AS FirstName,
             Email_Consent,
             Email,
             LastPurchaseDate,
             Region,
            'SPRING20' AS CouponCode
FROM        [Customer_Master]  

/* CAMPAIGN CRITERIA */
WHERE       Region IN ('AU', 'NZ')
AND         Email_Consent = 'TRUE'
AND         (
              LastPurchaseDate <= DATEADD(Month, -6, GETDATE() AT TIME ZONE 'Central Standard Time' AT TIME ZONE 'AUS Eastern Standard Time')
              OR 
              LastPurchaseDate IS NULL 
             )
