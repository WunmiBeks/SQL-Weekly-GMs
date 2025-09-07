SELECT      SubscriberKey,  
            UPPER(LEFT(FirstName, 1)) + LOWER(RIGHT(FirstName, LEN(FirstName) - 1)) AS FirstName, 
            Email, 
            Region, 
            MembershipType, 
            VisitsLast30Days, 
            Email_Consent, 
            SignupDate, 
            GoalPreference, 
FROM         [Customer_Engagement]

            /* Campaign Criteria */
WHERE       Region IN ('UK', 'Canada', 'Singapore')
AND         Email_Consent = 1
AND         MembershipType NOT IN ('Premium')
AND         VisitsLast30Days = 0
AND         GoalPreference IN ('Weight Loss', 'General Fitness')
