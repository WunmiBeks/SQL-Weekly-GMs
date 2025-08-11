SELECT    SubscriberKey, 
          UPPER(LEFT(FirstName, 1)) + LOWER(RIGHT(FirstName, LEN(FirstName) -1)) AS FirstName, 
          Email, 
          Region, 
          CardType, 
          Email_Consent, 
          LastEngagementDate, 
          OutstandingBalance, 
          /* New filed for the urgent flag */
          CASE
              WHEN OutstandingBalance > 2000 THEN 1
              ELSE 0
          END AS isUrgent
FROM      [Customer_Banking]
        /* Campaign Criteria */
WHERE     Region IN ('AU')
AND       CardType NOT IN ('Silver')
AND       OutstandingBalance > 500
AND       Email_Consent = 1
AND       (LastEngagementDate <= DATEADD(D, -180, GETDATE() 
                                     AT TIME ZONE 'Central Standard Time' 
                                     AT TIME ZONE 'AUS Eastern Standard Time')
	       OR 
	       
	       LastEngagementDate IS NULL )