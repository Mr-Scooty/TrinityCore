-- Make Drowning Watchman NPC spell-clickable for the quest
UPDATE creature_template SET npcflag = npcflag | 0x100 WHERE entry = 36440;
INSERT INTO npc_spellclick_spells (npc_entry, spell_id, cast_flags, user_type, quest_start) 
 VALUES (36440, 68735, 1, 0, 14395);

-- SmartAI for NPC: on spell 68735 hit, enter vehicle (player)
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) 
 VALUES (36440, 0, 0, 0, 8, 0, 100, 0, 68735, 0, 0, 0, 33, 36450, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Drowning Watchman - On Spellhit - Give Kill Credit');

-- Link area trigger to script (use actual AreaTrigger ID for the shore)
INSERT INTO areatrigger_scripts VALUES (5437, 'at_gasping_for_breath');

-- Ensure quest kill-credit is set to 36450 for 4 required
UPDATE quest_template SET RequiredNpcOrGo1=36450, RequiredNpcOrGoCount1=4 WHERE Id=14395;
