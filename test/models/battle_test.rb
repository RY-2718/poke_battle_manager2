require 'test_helper'

class BattleTest < ActiveSupport::TestCase
  def setup
    @user = users(:alice)
    @battle = @user.battles.create(my_rate: 1500, opp_rate: 1500, result: true)
    @battle.my_pokes << my_pokes(:pikachu)
    @battle.my_pokes << my_pokes(:garchomp)
    @battle.my_pokes << my_pokes(:charizard)
    @battle.opp_pokes.create(name: "フシギダネ")
    @battle.opp_pokes.create(name: "フシギソウ")
    @battle.opp_pokes.create(name: "フシギバナ")
  end

  test "should be valid" do
    assert @battle.valid?
  end

  test "my_rate should be present" do
    @battle.my_rate = nil
    assert_not @battle.valid?
  end

  test "opp_rate should be present" do
    @battle.opp_rate = nil
    assert_not @battle.valid?
  end

  test "battle.my_poke should be unique" do
    @battle.battle_my_pokes[0].my_poke_id = @battle.battle_my_pokes[1].my_poke_id
    assert_not @battle.valid?
  end

  test "battle.opp_poke's name should be unique" do
    @battle.opp_pokes[0].name = @battle.opp_pokes[1].name
    assert_not @battle.valid?
  end
end
