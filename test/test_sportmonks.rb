require 'minitest/autorun'
require 'sportmonks'

class HolaTest < Minitest::Test
  def setup
    Sportmonks.configure do |config|
      config.api_token = "your API KEY here"
    end
  end

  def test_continents
    continents = Sportmonks.continents()
    assert continents["data"].size > 0
  end

  def test_continent
    assert Sportmonks.continent(1)["data"]["id"]
  end

  def test_countries
    assert Sportmonks.countries()["data"].size > 0
  end

  def test_country
    assert Sportmonks.country(515)["data"]["id"]
  end

  def test_leagues
    assert Sportmonks.leagues()["data"].size > 0
  end

  def test_league
    assert Sportmonks.league(2)["data"]["id"]
  end

  def test_seasons
    assert Sportmonks.seasons()["data"].size > 0
  end

  def test_season
    assert Sportmonks.season(5307)["data"]["id"]
  end

  def test_fixtures_by_date
    assert Sportmonks.fixtures_by_date(Date.new(2018, 12, 2))["data"].size > 0
  end

  def test_fixtures
    assert Sportmonks.fixtures([10328828])["data"].size > 0
  end

  def test_fixture
    assert Sportmonks.fixture(10328828)["data"]["id"]
  end

  def test_fixtures_between
    assert Sportmonks.fixtures_between(Date.new(2018, 12, 1), Date.new(2018, 12, 2), [271])["data"].size > 0
  end

  def test_fixtures_between_by_team
    assert Sportmonks.fixtures_between_by_team(Date.new(2018, 12, 1), Date.new(2018, 12, 2), 390, [271])["data"].size > 0
  end
end
