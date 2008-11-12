function onSay(cid, words, param)
	if(param == "") then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command requires param.")
		return FALSE
	end

	local target = getPlayerByNameWildcard(param)
	if(target == 0) then
		target = getCreatureByName(param)
		if(target == 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Creature not found.")
			return FALSE
		end
	end

	local pos = getClosestFreeTile(target, getCreaturePosition(cid))
	if(pos == LUA_ERROR or isInArray({pos.x, pos.y, pos.z}, 0) == TRUE) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You cannot teleport there.")
		return FALSE
	end

	local tmp = getCreaturePosition(target)
	if(doTeleportThing(target, pos, TRUE) ~= LUA_ERROR and isPlayerGhost(target) ~= TRUE) then
		doSendMagicEffect(tmp, CONST_ME_POFF)
		doSendMagicEffect(pos, CONST_ME_TELEPORT)
	end

	return TRUE
end
