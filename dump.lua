(function()
    local raw = Game.start_up
    function Game.start_up(...)
        raw(...)

        G.E_MANAGER:add_event(Event {
            trigger = 'after',
            blocking = false,
            blockable = false,
            delay = 1.0,
            no_delete = true,
            timer = 'REAL',
            func = function()
                local sep = love.system.getOS() == 'Windows' and '/' or '\\'

                local info = love.filesystem.getInfo('jokerDump')
                if not info then
                    if not love.filesystem.createDirectory('jokerDump') then
                        error("Could not create jokerDump")
                    end
                elseif info.type ~= 'directory' then
                    error(
                        love.filesystem.getSaveDirectory() .. sep .. 'jokerDump is not a directory, instead it is a ' ..
                            info.type)
                end

                local function log(msg, logger)
                    if sendInfoMessage then
                        sendInfoMessage(msg, logger)
                    else
                        print(msg)
                    end
                end

                local vanilla_keys = {
                    j_joker = true,
                    j_greedy_joker = true,
                    j_lusty_joker = true,
                    j_wrathful_joker = true,
                    j_gluttenous_joker = true,
                    j_jolly = true,
                    j_zany = true,
                    j_mad = true,
                    j_crazy = true,
                    j_droll = true,
                    j_sly = true,
                    j_wily = true,
                    j_clever = true,
                    j_devious = true,
                    j_crafty = true,
                    j_half = true,
                    j_stencil = true,
                    j_four_fingers = true,
                    j_mime = true,
                    j_credit_card = true,
                    j_ceremonial = true,
                    j_banner = true,
                    j_mystic_summit = true,
                    j_marble = true,
                    j_loyalty_card = true,
                    j_8_ball = true,
                    j_misprint = true,
                    j_dusk = true,
                    j_raised_fist = true,
                    j_chaos = true,
                    j_fibonacci = true,
                    j_steel_joker = true,
                    j_scary_face = true,
                    j_abstract = true,
                    j_delayed_grat = true,
                    j_hack = true,
                    j_pareidolia = true,
                    j_gros_michel = true,
                    j_even_steven = true,
                    j_odd_todd = true,
                    j_scholar = true,
                    j_business = true,
                    j_supernova = true,
                    j_ride_the_bus = true,
                    j_space = true,
                    j_egg = true,
                    j_burglar = true,
                    j_blackboard = true,
                    j_runner = true,
                    j_ice_cream = true,
                    j_dna = true,
                    j_splash = true,
                    j_blue_joker = true,
                    j_sixth_sense = true,
                    j_constellation = true,
                    j_hiker = true,
                    j_faceless = true,
                    j_green_joker = true,
                    j_superposition = true,
                    j_todo_list = true,
                    j_cavendish = true,
                    j_card_sharp = true,
                    j_red_card = true,
                    j_madness = true,
                    j_square = true,
                    j_seance = true,
                    j_riff_raff = true,
                    j_vampire = true,
                    j_shortcut = true,
                    j_hologram = true,
                    j_vagabond = true,
                    j_baron = true,
                    j_cloud_9 = true,
                    j_rocket = true,
                    j_obelisk = true,
                    j_midas_mask = true,
                    j_luchador = true,
                    j_photograph = true,
                    j_gift = true,
                    j_turtle_bean = true,
                    j_erosion = true,
                    j_reserved_parking = true,
                    j_mail = true,
                    j_to_the_moon = true,
                    j_hallucination = true,
                    j_fortune_teller = true,
                    j_juggler = true,
                    j_drunkard = true,
                    j_stone = true,
                    j_golden = true,
                    j_lucky_cat = true,
                    j_baseball = true,
                    j_bull = true,
                    j_diet_cola = true,
                    j_trading = true,
                    j_flash = true,
                    j_popcorn = true,
                    j_trousers = true,
                    j_ancient = true,
                    j_ramen = true,
                    j_walkie_talkie = true,
                    j_selzer = true,
                    j_castle = true,
                    j_smiley = true,
                    j_campfire = true,
                    j_ticket = true,
                    j_mr_bones = true,
                    j_acrobat = true,
                    j_sock_and_buskin = true,
                    j_swashbuckler = true,
                    j_troubadour = true,
                    j_certificate = true,
                    j_smeared = true,
                    j_throwback = true,
                    j_hanging_chad = true,
                    j_rough_gem = true,
                    j_bloodstone = true,
                    j_arrowhead = true,
                    j_onyx_agate = true,
                    j_glass = true,
                    j_ring_master = true,
                    j_flower_pot = true,
                    j_blueprint = true,
                    j_wee = true,
                    j_merry_andy = true,
                    j_oops = true,
                    j_idol = true,
                    j_seeing_double = true,
                    j_matador = true,
                    j_hit_the_road = true,
                    j_duo = true,
                    j_trio = true,
                    j_family = true,
                    j_order = true,
                    j_tribe = true,
                    j_stuntman = true,
                    j_invisible = true,
                    j_brainstorm = true,
                    j_satellite = true,
                    j_shoot_the_moon = true,
                    j_drivers_license = true,
                    j_cartomancer = true,
                    j_astronomer = true,
                    j_burnt = true,
                    j_bootstraps = true,
                    j_caino = true,
                    j_triboulet = true,
                    j_yorick = true,
                    j_chicot = true,
                    j_perkeo = true,
                    c_fool = true,
                    c_magician = true,
                    c_high_priestess = true,
                    c_empress = true,
                    c_emperor = true,
                    c_heirophant = true,
                    c_lovers = true,
                    c_chariot = true,
                    c_justice = true,
                    c_hermit = true,
                    c_wheel_of_fortune = true,
                    c_strength = true,
                    c_hanged_man = true,
                    c_death = true,
                    c_temperance = true,
                    c_devil = true,
                    c_tower = true,
                    c_star = true,
                    c_moon = true,
                    c_sun = true,
                    c_judgement = true,
                    c_world = true,
                    v_overstock_norm = true,
                    v_overstock_plus = true,
                    v_clearance_sale = true,
                    v_liquidation = true,
                    v_hone = true,
                    v_glow_up = true,
                    v_reroll_surplus = true,
                    v_reroll_glut = true,
                    v_crystal_ball = true,
                    v_omen_globe = true,
                    v_telescope = true,
                    v_observatory = true,
                    v_grabber = true,
                    v_nacho_tong = true,
                    v_wasteful = true,
                    v_recyclomancy = true,
                    v_tarot_merchant = true,
                    v_tarot_tycoon = true,
                    v_planet_merchant = true,
                    v_planet_tycoon = true,
                    v_seed_money = true,
                    v_money_tree = true,
                    v_blank = true,
                    v_antimatter = true,
                    v_magic_trick = true,
                    v_illusion = true,
                    v_hieroglyph = true,
                    v_petroglyph = true,
                    v_directors_cut = true,
                    v_retcon = true,
                    v_paint_brush = true,
                    v_palette = true,
                    b_red = true,
                    b_blue = true,
                    b_yellow = true,
                    b_green = true,
                    b_black = true,
                    b_magic = true,
                    b_nebula = true,
                    b_ghost = true,
                    b_abandoned = true,
                    b_checkered = true,
                    b_zodiac = true,
                    b_painted = true,
                    b_anaglyph = true,
                    b_plasma = true,
                    b_erratic = true,
                    p_arcana_normal_1 = true,
                    p_arcana_normal_2 = true,
                    p_arcana_normal_3 = true,
                    p_arcana_normal_4 = true,
                    p_arcana_jumbo_1 = true,
                    p_arcana_jumbo_2 = true,
                    p_arcana_mega_1 = true,
                    p_arcana_mega_2 = true,
                    p_celestial_normal_1 = true,
                    p_celestial_normal_2 = true,
                    p_celestial_normal_3 = true,
                    p_celestial_normal_4 = true,
                    p_celestial_jumbo_1 = true,
                    p_celestial_jumbo_2 = true,
                    p_celestial_mega_1 = true,
                    p_celestial_mega_2 = true,
                    p_standard_normal_1 = true,
                    p_standard_normal_2 = true,
                    p_standard_normal_3 = true,
                    p_standard_normal_4 = true,
                    p_standard_jumbo_1 = true,
                    p_standard_jumbo_2 = true,
                    p_standard_mega_1 = true,
                    p_standard_mega_2 = true,
                    p_buffoon_normal_1 = true,
                    p_buffoon_normal_2 = true,
                    p_buffoon_jumbo_1 = true,
                    p_buffoon_mega_1 = true,
                    p_spectral_normal_1 = true,
                    p_spectral_normal_2 = true,
                    p_spectral_jumbo_1 = true,
                    p_spectral_mega_1 = true,
                    m_bonus = true,
                    m_mult = true,
                    m_wild = true,
                    m_glass = true,
                    m_steel = true,
                    m_stone = true,
                    m_gold = true,
                    m_lucky = true,
                    c_mercury = true,
                    c_venus = true,
                    c_earth = true,
                    c_mars = true,
                    c_jupiter = true,
                    c_saturn = true,
                    c_uranus = true,
                    c_neptune = true,
                    c_pluto = true,
                    c_planet_x = true,
                    c_ceres = true,
                    c_eris = true,
                    c_familiar = true,
                    c_grim = true,
                    c_incantation = true,
                    c_talisman = true,
                    c_aura = true,
                    c_wraith = true,
                    c_sigil = true,
                    c_ouija = true,
                    c_ectoplasm = true,
                    c_immolate = true,
                    c_ankh = true,
                    c_deja_vu = true,
                    c_hex = true,
                    c_trance = true,
                    c_medium = true,
                    c_cryptid = true,
                    c_soul = true,
                    c_black_hole = true,
                    stake_white = true,
                    stake_red = true,
                    stake_green = true,
                    stake_black = true,
                    stake_blue = true,
                    stake_purple = true,
                    stake_orange = true,
                    stake_gold = true,
                    tag_uncommon = true,
                    tag_rare = true,
                    tag_negative = true,
                    tag_foil = true,
                    tag_holo = true,
                    tag_polychrome = true,
                    tag_investment = true,
                    tag_voucher = true,
                    tag_boss = true,
                    tag_standard = true,
                    tag_charm = true,
                    tag_meteor = true,
                    tag_buffoon = true,
                    tag_handy = true,
                    tag_garbage = true,
                    tag_ethereal = true,
                    tag_coupon = true,
                    tag_double = true,
                    tag_juggle = true,
                    tag_d_six = true,
                    tag_top_up = true,
                    tag_skip = true,
                    tag_orbital = true,
                    tag_economy = true,
                    bl_final_bell = true,
                    bl_needle = true,
                    bl_small = true,
                    bl_arm = true,
                    bl_final_heart = true,
                    bl_wheel = true,
                    bl_mouth = true,
                    bl_fish = true,
                    bl_pillar = true,
                    bl_final_acorn = true,
                    bl_hook = true,
                    bl_head = true,
                    bl_goad = true,
                    bl_final_leaf = true,
                    bl_ox = true,
                    bl_flint = true,
                    bl_final_vessel = true,
                    bl_tooth = true,
                    bl_serpent = true,
                    bl_big = true,
                    bl_manacle = true,
                    bl_window = true,
                    bl_psychic = true,
                    bl_plant = true,
                    bl_eye = true,
                    bl_house = true,
                    bl_water = true,
                    bl_wall = true,
                    bl_club = true,
                    bl_mark = true
                }
                function dump_objects_to_file(set, extra, extra_header, no_cost, no_desc, obj, key_flag, f_name, f_desc)
                    pcall(function()
                        local output = "ID\tName"
                        if not no_desc then
                            output = output .. '\tDescription'
                        end
                        if extra then
                            output = output .. '\t' .. extra_header
                        end
                        if not no_cost then
                            output = output .. '\tCost'
                        end
                        output = output .. '\n'
                        obj = obj or G.P_CENTER_POOLS[set]
                        local f = key_flag and pairs or ipairs
                        for k, v in f(obj) do
                            local key = key_flag and k or v.key
                            if not vanilla_keys[key] then
                                output = output .. key .. '\t' .. (f_name and f_name(v) or localize {
                                    type = 'name_text',
                                    set = set,
                                    key = key
                                })
                                if not no_desc then
                                    output = output .. "\t"
                                    local desc = f_desc and f_desc(v) or G.localization.descriptions[set][key].text
                                    if type(desc) == "table" then
                                        if #desc >= 1 then
                                            output = output .. desc[1]
                                            for i = 2, #desc do
                                                output = output .. '\\n' .. desc[i]
                                            end
                                        end
                                    else
                                        output = output .. desc
                                    end
                                end
                                if extra then
                                    output = output .. '\t' .. extra(v)
                                end
                                if not no_cost then
                                    output = output .. '\t' .. v.cost
                                end
                                output = output .. '\n'
                            end
                        end

                        local success, message = love.filesystem.write('jokerDump' .. sep .. set .. '.csv', output)
                        if not success then
                            error("Dumping set " .. set .. " failed with inner message:\n" .. message)
                        end
                        log("Set " .. set .. ' dumped', "dumper")
                    end)
                end
                dump_objects_to_file("Joker", function(j)
                    return j.rarity
                end, "Rarity")
                dump_objects_to_file("Tarot")
                dump_objects_to_file("Voucher")
                dump_objects_to_file("Back", nil, nil, true)
                dump_objects_to_file("Planet")
                dump_objects_to_file("Spectral")
                dump_objects_to_file("Enhanced", nil, nil, true)
                dump_objects_to_file("Seal", nil, nil, true, nil, nil, nil, nil, function(s)
                    return G.localization.descriptions.Other[s.key].text
                end)
                dump_objects_to_file("Booster", nil, nil, nil, true, nil, nil, nil, function(b)
                    return G.localization.descriptions.Other[b.key].text
                end)
                dump_objects_to_file("Tag", nil, nil, true)
                dump_objects_to_file("Blind", function(b)
                    if b.boss_colour then
                        return string.format("%x", b.boss_colour[1] * 255) ..
                                   string.format("%x", b.boss_colour[2] * 255) ..
                                   string.format("%x", b.boss_colour[3] * 255) ..
                                   string.format("%x", b.boss_colour[4] * 255)
                    end
                    return "ERROR"
                end, "Color", true, nil, G.P_BLINDS, true)
                dump_objects_to_file("Stake", nil, nil, true)

                log("Objects dumped to " .. love.filesystem.getSaveDirectory() .. sep .. 'jokerDump', "dumper")
                return true
            end
        })
    end
end)()
