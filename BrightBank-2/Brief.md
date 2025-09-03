# Project Brief

## Outstanding Balance Notification

An adhoc account balance reminder email is being set up to go out to selected customers, and a target audience should be created.

They need to meet the following:
- Must be in Australia
- Have any credit card except 'Silver' (Field is CardType)
- OutstandingBalance > $500

But only if:
- They haven’t engaged with us in the last 180 days (check LastEngagementDate)
- OR they’ve never engaged

In the journey, we’d also like to treat customers differently depending on how high their outstanding balance is — specifically, if they have more than $2000 outstanding, they get pushed down a more urgent path.