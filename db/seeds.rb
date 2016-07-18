require './models/event'

Event.create({
		title: 'Generic Event',
		image_url: "https://static.pexels.com/photos/5156/people-eiffel-tower-lights-night-large.jpg", 
		Location: 'Denver',
		description: 'this is my description',
		link: "https://www.pexels.com/photo/people-eiffel-tower-lights-night-5156/", 
		time_sensitive: true
	})