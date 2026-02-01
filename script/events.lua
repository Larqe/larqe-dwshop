--ALGOS
addEvent('shop.giveItem', true)
addEventHandler('shop.giveItem', root, function(item, cash, weaponID)
  if source:getData('loggedin') == 1 then
    if tonumber(cash) and tonumber(item) then
      if exports.global:takeMoney(source, cash) then
        if tonumber(item) == 2 then
          local itemValue = math.random(530, 542) .. math.random(0, 9) .. math.random(0, 9) .. math.random(0, 9) .. math.random(0, 9) .. math.random(0, 9) .. math.random(0, 9) .. math.random(0, 9)
          exports.global:giveItem(source, item, itemValue)
          source:outputChat('#66FF00[!]#ffffff Başarıyla eşyayı satın aldınız!',195,184,116,true)
        elseif tonumber(item) == 115 then
          local mySerial = exports.global:createWeaponSerial( 1, getElementData(source, "dbid"))
          if not exports.global:giveItem(source, 115, weaponID..":"..mySerial..":"..getWeaponNameFromID(weaponID).."::") then
            outputChatBox("[!] #f9f9f9Envanterinizde yeterli yeriniz bulunmadığı için işlem iptal edildi.", source, 255, 0, 0, true)
          else
            exports.global:takeMoney(source, cash)
            outputChatBox("[!] #f9f9f9Başarıyla ["..cash.."₺] karşılığında "..getWeaponNameFromID(weaponID).." satın aldınız.", source, 0, 255, 0, true)
          end
        else
          exports.global:giveItem(source, item, 1)
          source:outputChat('#66FF00[!]#ffffff Başarıyla eşyayı satın aldınız!',195,184,116,true)
        end
      else
        source:outputChat('#66FF00[!]#ffffff Bu eşyayı alabilmek için yeterli miktarda paranız yok!',195,184,116,true)
      end
    end
  end
end)
