SELECT venuename,sum(numtickets)-sum(qtysold) AS unsold_tickets
FROM sql_masterclass.listing
LEFT JOIN sql_masterclass.sales
ON listing.listid=sales.listid
LEFT JOIN sql_masterclass.event
ON sales.eventid=event.eventid
LEFT join sql_masterclass.venue
ON event.venueid=venue.venueid
WHERE venue.venueid IN (SELECT DISTINCT venueid FROM sql_masterclass.venue WHERE venuestate='OH')
GROUP BY venuename;



