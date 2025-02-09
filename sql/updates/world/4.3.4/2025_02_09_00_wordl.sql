-- Make Drowning Watchman NPC spell-clickable for the quest
UPDATE creature_template SET npcflag = npcflag | 0x100 WHERE entry = <NPC_ID>;
INSERT INTO npc_spellclick_spells (npc_entry, spell_id, cast_flags, user_type, quest_start) 
 VALUES (<NPC_ID>, 68735, 1, 0, 14395);

-- SmartAI for NPC: on spell 68735 hit, enter vehicle (player)
INSERT INTO smart_scripts (...) 
 VALUES (<NPC_ID>, 0, ..., SMART_EVENT_SPELLHIT, 68735, ... , SMART_ACTION_ENTER_VEHICLE, 0, SMART_TARGET_INVOKER, ...);

-- Link area trigger to script (use actual AreaTrigger ID for the shore)
INSERT INTO areatrigger_scripts VALUES (<TriggerID>, 'at_gasping_for_breath');

-- Ensure quest kill-credit is set to 36450 for 4 required
UPDATE quest_template SET RequiredNpcOrGo1=36450, RequiredNpcOrGoCount1=4 WHERE Id=14395;
