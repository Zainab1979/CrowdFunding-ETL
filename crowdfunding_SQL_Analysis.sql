-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 


select cf_id, backers_count
from campaign 
where outcome = 'live' 
order by backers_count desc;



-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

select cf_id, count(backer_id) backer_counts 
from backers 
group by  backers.cf_id 
order by count(backer_id) desc;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

drop table if exists  email_contacts_remaining_goal_amount; 

select first_name, last_name, email,
     goal-Pledged "Remaining Goal Amount" into email_contacts_remaining_goal_amount
from contacts join  campaign 
on contacts.contact_id = campaign.contact_id 
where outcome = 'live'
order by goal-pledged desc; 


-- Check the table


select * from email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that
--contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

drop table if exists  email_backers_remaining_goal_amount; 

select email, first_name, last_name,
   backers.cf_id, company_name, description,
       end_date, goal-Pledged  "Left of Goal" into email_backers_remaining_goal_amount
from backers join campaign 
on backers.cf_id = campaign.cf_id 
order by last_name;





-- Check the table

select * from email_backers_remaining_goal_amount; 



