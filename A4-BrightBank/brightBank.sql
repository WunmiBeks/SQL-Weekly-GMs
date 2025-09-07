SELECT      SubscriberKey, 
            FirstName, 
            LastName, 
            Email_Consent, 
            Status, 
            MailingAddress, 
            Email, 
            LastOpenedDate, 
            LastClickedDate
FROM        [Customer_Master]

WHERE       
          (
            (LastOpenedDate < DATEADD(M, -12, GETDATE()) OR LastOpenedDate IS NULL)
            AND
            (LastClickedDate < DATEADD(M, -12, GETDATE()) OR LastClickedDate IS NULL)
          )
          
         OR (Email_Consent = 'False')

         OR (Status = 'Inactive' AND MailingAddress IS NULL)

         OR (Email LIKE '%@test.com' OR Email LIKE '%@fake.com' OR Email LIKE '%@example.com'
          )
