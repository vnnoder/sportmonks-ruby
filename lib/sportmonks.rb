module Sportmonks
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end

    def continents(options = {})
      Sportmonks::Api.api_get("/continents", options)
    end

    def continent(id, options = {})
      Sportmonks::Api.api_get("/continents/#{id}", options)
    end

    def countries(options = {})
      Sportmonks::Api.api_get("/countries", options)
    end

    def country(id, options = {})
      Sportmonks::Api.api_get("/countries/#{id}", options)
    end

    def leagues(options = {})
      Sportmonks::Api.api_get("/leagues", options)
    end

    def league(id, options = {})
      Sportmonks::Api.api_get("/leagues/#{id}", options)
    end

    def seasons(options = {})
      Sportmonks::Api.api_get("/seasons", options)
    end

    def season(id, options = {})
      Sportmonks::Api.api_get("/seasons/#{id}", options)
    end

    def fixture(id, options = {})
      Sportmonks::Api.api_get("/fixtures/#{id}", options)
    end

    def fixtures(ids, options = {})
      ids_param = ids.join(",")
      Sportmonks::Api.api_get("/fixtures/multi/#{ids_param}", options)
    end

    def fixtures_by_date(date, options = {})
      date_str = format_date(date)
      Sportmonks::Api.api_get("/fixtures/date/#{date_str}", options)
    end

    def fixtures_between(from, to, league_ids = [], options = {})
      from_str = format_date(from)
      to_str = format_date(to)
      leagues_param = format_league_ids(league_ids)

      if leagues_param
        Sportmonks::Api.api_get(
          "/fixtures/between/#{from_str}/#{to_str}",
          options.merge({leagues: leagues_param})
        )
      else
        Sportmonks::Api.api_get("/fixtures/between/#{from_str}/#{to_str}", options)
      end
    end

    def fixtures_between_by_team(from, to, team_id, league_ids = [], options = {})
      from_str = format_date(from)
      to_str = format_date(to)
      leagues_param = format_league_ids(league_ids)

      if leagues_param
        Sportmonks::Api.api_get(
          "/fixtures/between/#{from_str}/#{to_str}/#{team_id}",
          options.merge({leagues: leagues_param})
        )
      else
        Sportmonks::Api.api_get("/fixtures/between/#{from_str}/#{to_str}/#{team_id}", options)
      end
    end

    def stages_by_season(season_id, options = {})
      Sportmonks::Api.api_get("/stages/season/#{season_id}", options)
    end

    def stages(id, options = {})
      Sportmonks::Api.api_get("/stages/#{id}", options)
    end

    def live_scores(league_ids = [], options = {})
      leagues_param = format_league_ids(league_ids)

      if leagues_param
        Sportmonks::Api.api_get("/livescores", options.merge({leagues: leagues_param}))
      else
        Sportmonks::Api.api_get("/livescores", options)
      end
    end

    def live_scores_in_play(league_ids = [], options = {})
      leagues_param = format_league_ids(league_ids)

      if leagues_param
        Sportmonks::Api.api_get("/livescores/now", options.merge({leagues: leagues_param}))
      else
        Sportmonks::Api.api_get("/livescores/now", options)
      end
    end

    def commentaries_by_fixture(fixture_id, options = {})
      Sportmonks::Api.api_get("/commentaries/fixture/#{fixture_id}", options)
    end

    def highlights(options = {})
      Sportmonks::Api.api_get("/highlights", options)
    end

    def head_2_head(team1_id, team2_id, options = {})
      Sportmonks::Api.api_get("/head2head/#{team1_id}/#{team2_id}", options)
    end

    def tv_stations_by_fixture(fixture_id, options = {})
      Sportmonks::Api.api_get("/tvstations/fixture/#{fixture_id}", options)
    end

    def standings_by_season(season_id, options = {})
      Sportmonks::Api.api_get("/standings/season/#{season_id}", options)
    end

    def team(id, options = {})
      Sportmonks::Api.api_get("/teams/#{id}", options)
    end

    def teams_by_season(season_id, options = {})
      Sportmonks::Api.api_get("/teams/season/#{season_id}", options)
    end

    def top_scorer_by_season(season_id, options = {})
      Sportmonks::Api.api_get("/topscorers/season/#{season_id}", options)
    end

    def aggregated_top_scorer_by_season(season_id, options = {})
      Sportmonks::Api.api_get("/topscorers/season/#{season_id}/aggregated", options)
    end

    def venue(id, options = {})
      Sportmonks::Api.api_get("/venues/#{id}", options)
    end

    def venues_by_season(season_id, options = {})
      Sportmonks::Api.api_get("/venues/season/#{season_id}", options)
    end

    def round(id)
      Sportmonks::Api.api_get("/rounds/#{id}")
    end

    def rounds_by_season(season_id, options = {})
      Sportmonks::Api.api_get("/rounds/season/#{season_id}", options)
    end

    def odds_by_fixure_and_bookmaker(fixture_id, bookmaker_id, options = {})
      Sportmonks::Api.api_get("odds/fixture/#{fixture_id}/bookmaker/#{bookmaker_id}", options)
    end

    def odds_by_fixure(fixture_id, options = {})
      Sportmonks::Api.api_get("odds/fixture/#{fixture_id}", options)
    end

    def odds_by_fixure_and_market(fixture_id, market_id, options = {})
      Sportmonks::Api.api_get("odds/fixture/#{fixture_id}/market/#{market_id}", options)
    end

    def bookmakers(options = {})
      Sportmonks::Api.api_get("bookmakers", options)
    end

    def bookmaker(bookmaker_id, options = {})
      Sportmonks::Api.api_get("bookmakers/#{bookmaker_id}", options)
    end

    def markets(options = {})
      Sportmonks::Api.api_get("markets", options)
    end

    def market(market_id, options = {})
      Sportmonks::Api.api_get("markets/#{market_id}", options)
    end

    # notice that this api is for bet365 only
    def in_play_odds_by_fixure(fixture_id, options = {})
      Sportmonks::Api.api_get("odds/inplay/fixture/#{fixture_id}", options)
    end

    def player(player_id, options = {})
      Sportmonks::Api.api_get("players/#{player_id}", options)
    end

    def squad_by_season_and_team(season_id, team_id, options = {})
      Sportmonks::Api.api_get("squad/season/#{season_id}/team/#{team_id}", options)
    end

    def coach(coach_id, options = {})
      Sportmonks::Api.api_get("coaches/#{coach_id}", options)
    end

    private

    def format_date(date)
      date.strftime("%Y-%m-%d")
    end

    def format_league_ids(league_ids)
      if league_ids.size > 0
        league_ids.join(",")
      else
        nil
      end
    end
  end
end

class Configuration
  attr_accessor :api_token
end

require 'sportmonks/api'
