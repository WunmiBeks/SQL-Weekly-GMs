SELECT       SubscriberKey,
             FirstName,
             UPPER(LEFT(FirstName, 1)) + LOWER(RIGHT(FirstName, LEN(FirstName) -1)) AS FirstNameUpper,
             Email_Consent,
             Email,
             LastPurchaseDate,
             Region,
             CASE 
                 WHEN Region = 'AU' THEN 'AU-SPRING20'
                 WHEN Region = 'NZ' THEN 'NZ-SPRING20'
            END AS CouponCode
FROM        [Customer_Master]  
/* CAMPAIGN CRITERIA */
WHERE       Region IN ('AU', 'NZ')
AND         LastPurchaseDate <= DATEADD(M, -6, GETDATE() AT TIME ZONE 'Central Standard Time' AT TIME ZONE 'Mountain Standard Time')
AND         Email_Consent = 'TRUE'