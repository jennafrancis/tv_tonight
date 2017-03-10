# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application - run ./bin/tv-tonight to initialize and call a new instance of the TvTonight::CLI class
- [x] Pull data from an external source - TvTonight::Episode class method .scrape_episodes pulls data from TV Guide at http://www.tvguide.com/trending-tonight/
- [x] Implement both list and detail views - interact with the CLI, first receiving a list of tonight's trending shows, then entering the number of the show you'd like to know more about
