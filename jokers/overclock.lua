SMODS.Joker{ --Overclock
    key = "overclock",
    config = {
        extra = {
            money÷1 = 1,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Overclock',
        ['text'] = {
            [1] = 'Create a {C:dark_edition}Negative{} {C:attention}Boss Farming Guide{}',
            [2] = 'when {C:green}shop{} is rerolled',
            [3] = '{X:legendary,C:white}^1{} Mult for every {C:money}${} owned'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 17,
    rarity = "sholatro_the_pro",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.ignore, card.ability.extra.money÷1 + ((math.floor(lenient_bignum(G.GAME.dollars)) or 0))}}
    end,

    calculate = function(self, card, context)
        if context.reroll_shop  then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sholatro_bossfarmingguide' })
                    if joker_card then
                        joker_card:set_edition("e_negative", true)
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end
                }
        end
        if context.cardarea == G.jokers and context.joker_main and lenient_bignum(G.GAME.dollars) >= 1 then
                return {
                    e_mult = card.ability.extra.money÷1 + (math.floor(lenient_bignum(G.GAME.dollars)))
                }
        end
    end
}
