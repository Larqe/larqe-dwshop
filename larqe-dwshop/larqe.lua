-- ALGOS

local sx, sy = guiGetScreenSize()
local w, h = 700, 500
local panelX, panelY = (sx - w) / 2, (sy - h) / 2

local RobotoB = exports.fonts:getFont("RobotoB", 9)
local clicked = false

local ped = createPed(34, -381.8994, -1438.7363, 25.7266, 263)
setElementInterior(ped, 0)
setElementDimension(ped, 0)
setElementFrozen(ped, true)

-- Ürünler
-- extra alanı varsa triggerServerEvent argümanına ekleniyor
local items = {
    { id = 598, cost = 5000, img = "img/agirzirh.png",      extra = nil },
    { id = 597, cost = 2500, img = "img/hafifzirh.png",     extra = nil },
    { id = 599, cost = 3000, img = "img/saglikcantasi.png", extra = nil },
    { id = 600, cost = 2000, img = "img/sargibezi.png",     extra = nil },
    { id = 56,  cost = 500,  img = "img/maske.png",         extra = nil },
    { id = 601, cost = 500,  img = "img/eldiven.png",       extra = nil },
    { id = 603, cost = 500,  img = "img/ast.png",           extra = nil },
    { id = 602, cost = 500,  img = "img/li.png",            extra = nil },

    -- İkinci satır
    { id = 595, cost = 5000, img = "img/sss.png",           extra = nil },
    { id = 115, cost = 100,  img = "img/knife.png",         extra = 4 },
}

function dxIcShop()

    -- Panel arkası
    roundedRectangle(panelX, panelY, w, h, 13, tocolor(0, 0, 0, 255))
    roundedRectangle(panelX, panelY, w, 40, 15, tocolor(20, 20, 20, 255))
	local imgW, imgH = 90, 90
local imgX = panelX + (w - imgW) / 2
local imgY = panelY + (h - imgH) / 2
dxDrawImage(imgX, imgY, imgW, imgH, "img/dw.png")
    -- Başlık
    dxDrawText("İllegal Market", panelX, panelY, panelX + w, panelY + 40,
               tocolor(255, 255, 255, 200), 1.2, RobotoB, "center", "center", false, false, false, true)

    -- Dinamik grid ayarları
    local iconSize   = 75
    local innerPadX  = 20  -- panelX + innerPadX = ilk ikonun sol kenarı
    local innerPadY  = 60  -- panelY + innerPadY = ilk satırın üst kenarı
    local colsPerRow = 8
    local gapX = (w - innerPadX*2 - iconSize*colsPerRow) / (colsPerRow - 1)
    local rowHeight = 100

    -- Ürünleri yerleştir
    for i, it in ipairs(items) do
        local idx = i - 1
        local row = math.floor(idx / colsPerRow)
        local col = idx % colsPerRow

        local bx = panelX + innerPadX + col * (iconSize + gapX)
        local by = panelY + innerPadY + row * rowHeight

        -- Tıklama ve highlight
        if isMouseInPosition(bx, by, iconSize, iconSize) and getKeyState("mouse1") then
            if not clicked then
                clicked = true
                if it.extra then
                    triggerServerEvent('shop.giveItem', localPlayer, it.id, it.cost, it.extra)
                else
                    triggerServerEvent('shop.giveItem', localPlayer, it.id, it.cost)
                end
            else
                roundedRectangle(bx, by, iconSize, iconSize, 10, tocolor(11, 255, 3, 225))
            end
        end

        -- İkonu çiz
        dxDrawImage(bx, by + 5, 60, 60, it.img)

        -- Fiyatı çiz
        dxDrawText(
            it.cost .. "₺",
            bx, by + iconSize + 10,
            bx + iconSize, by + iconSize + 30,
            tocolor(255, 255, 255, clicked and 220 or 255),
            1, RobotoB, "center", "top", false, false, false, true
        )
    end

    -- Cüzdan
    local moneyText = "Cüzdan: " .. exports.global:formatMoney(getElementData(localPlayer, "money"))
    dxDrawText(
        moneyText,
        panelX, panelY, panelX + w, panelY + h - 10,
        tocolor(255, 255, 255, 220),
        1, RobotoB, "center", "bottom", false, false, false, true
    )

    -- Kapat butonu
    local closeSz = 32
    local closeX = panelX + w - closeSz - 10
    local closeY = panelY + 10
    dxDrawImage(closeX, closeY, closeSz, closeSz, "img/kapat.png")
    if isMouseInPosition(closeX, closeY, closeSz, closeSz) and getKeyState("mouse1") then
        if not clicked then
            clicked = true
            removeEventHandler("onClientRender", root, dxIcShop)
        end
    end
end

-- Yardımcı fonksiyonlar (aynı kaldı)
function roundedRectangle(x, y, width, height, radius, color, postGUI, subPixel)
    dxDrawRectangle(x+radius, y+radius, width-radius*2, height-radius*2, color, postGUI, subPixel)
    dxDrawCircle(x+radius, y+radius, radius, 180, 270, color, color, 16, 1, postGUI)
    dxDrawCircle(x+radius, y+height-radius, radius, 90, 180, color, color, 16, 1, postGUI)
    dxDrawCircle(x+width-radius, y+height-radius, radius, 0, 90, color, color, 16, 1, postGUI)
    dxDrawCircle(x+width-radius, y+radius, radius, 270, 360, color, color, 16, 1, postGUI)
    dxDrawRectangle(x, y+radius, radius, height-radius*2, color, postGUI, subPixel)
    dxDrawRectangle(x+radius, y, width-radius*2, radius, color, postGUI, subPixel)
    dxDrawRectangle(x+width-radius, y+radius, radius, height-radius*2, color, postGUI, subPixel)
    dxDrawRectangle(x+radius, y+height-radius, width-radius*2, radius, color, postGUI, subPixel)
end

function isMouseInPosition(x, y, width, height)
    if not isCursorShowing() then return false end
    local mx, my = getCursorPosition()
    local sw, sh = guiGetScreenSize()
    mx, my = mx * sw, my * sh
    return mx >= x and mx <= x + width and my >= y and my <= y + height
end

-- Click flag reset
setTimer(function() if clicked then clicked = false end end, 2000, 0)

-- Ped’e sağ tıkla aç
addEventHandler('onClientClick', root, function(button, state, _, _, _, _, _, clickedElement)
    if button == 'right' and state == 'down' and clickedElement == ped then
        addEventHandler("onClientRender", root, dxIcShop)
    end
end)

-- Ped hasarını iptal et
addEventHandler("onClientPedDamage", ped, function() cancelEvent() end)
