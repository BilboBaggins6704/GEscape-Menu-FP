config = GEscape or {}

include("autorun/client/gescape_config.lua")
local config = GEscape

escapemenu = escapemenu or {}
function escapemenu:show()

    bg = vgui.Create( "DPanel" )
        bg:SetSize( ScrW(), ScrH() )
        bg:Center()
        bg:MakePopup()
        bg:SetVisible ( true )
        bg.Paint = function(self)
            draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), config.Background)
            draw.DrawText(config.ServerName, "Head", self:GetWide() / 6.5, bg:GetTall() / 12.7, Color( 255, 255, 255, 255), TEXT_ALIGN_LEFT)
            draw.DrawText(Entity( 1 ):GetName(), "Mai", self:GetWide() / 1.28, bg:GetTall() / 13, TimeDate, TEXT_ALIGN_RIGHT)
            draw.DrawText(Entity( 1 ):SteamID(), "Mai", self:GetWide() / 1.28, bg:GetTall() / 9.5, TimeDate, TEXT_ALIGN_RIGHT)
        end

    local options = vgui.Create( "DButton", bg )
        options:SetSize( bg:GetWide() / 55, bg:GetTall() / 28 )
        options:SetText( "" )
        options:SetPos( bg:GetWide() / 1.214, bg:GetTall() / 6.4 )
        options:SetVisible( true )
        options.DoClick = function()
            RunConsoleCommand( "gamemenucommand", "openoptionsdialog" )
            gui.ActivateGameUI() 
        end
        options.Paint = function()
        if options:IsHovered() == true then
            surface.SetDrawColor( 255, 255, 255, 255 )
            surface.SetMaterial( Material("materials/gescape/options.png", "unlitgeneric") )
            surface.DrawTexturedRect( options:GetWide() / 12, options:GetTall() / 9, bg:GetWide() / 60, bg:GetTall() / 32 )
            else
            surface.SetDrawColor( 0, 0, 0, 220 )
            surface.SetMaterial( Material("materials/gescape/options.png", "unlitgeneric") )
            surface.DrawTexturedRect( options:GetWide() / 12, options:GetTall() / 9, bg:GetWide() / 60, bg:GetTall() / 33 )
            end
        end

        local Boxy = vgui.Create( "DFrame", bg )
            Boxy:SetPos( bg:GetWide() / 6.5, bg:GetTall() / 4.9 )
            Boxy:SetTitle( "" )
            Boxy:SetDraggable( false )
            Boxy:DockMargin( 5, 5, 5, 5 )
            Boxy:ShowCloseButton( false )
            Boxy:SetSize( bg:GetWide() / 1.454, bg:GetTall() / 1.5 )
            Boxy.Paint = function(self)
                draw.RoundedBox( 0, 0, 0, Boxy:GetWide(), Boxy:GetTall(), Color( 0, 0, 0, 235 ))
            end

        local MainSitey = vgui.Create( "HTML", Boxy )
            MainSitey:SetPos( 0, 0 )
            MainSitey:DockMargin( 5, 5, 5, 5 )
            MainSitey:Dock( FILL )
            MainSitey:OpenURL( config.MainSite )

        local MainBar = vgui.Create( "DHTMLControls", Boxy )
            MainBar:SetWide( Boxy:GetWide() / 1.014 )
            MainBar:DockMargin( 5, 5, 5, 5 )
            MainBar:SetPos( 9, 0 )
            MainBar:SetHTML ( MainSitey )
            MainBar.AddressBar:SetText( config.MainSite )

            MainSitey:MoveBelow( MainBar )

    local resume = vgui.Create( "DButton", bg )
        resume:SetSize( bg:GetWide() / 11, bg:GetTall() / 24.1 )
        resume:SetText( "" )
        resume:SetPos( bg:GetWide() / 6.5, bg:GetTall() / 6.5 )
        resume:SetVisible( true )
        resume.DoClick = function()

            hook.Remove( "HUDPaint", "OriginCam" )
            surface.PlaySound( "gescape/button.mp3" )
            bg:Remove()

        end
        resume.Paint = function()
        if resume:IsHovered() == true then
            draw.RoundedBox( 0, 0, 0, 200, 200, config.HoverBottom)
            draw.RoundedBox( 0, 0, 0, 200, 10, config.HoverTop)
            draw.DrawText("Resume!", "Mai", resume:GetWide() / 2.1, resume:GetTall() / 5, Color( 0, 0, 0, 255 ), TEXT_ALIGN_CENTER)
        else
            draw.RoundedBox( 0, 0, 0, 200, 200, config.MainColor)
            draw.DrawText("Resume!", "Mai", resume:GetWide() / 2.1, resume:GetTall() / 5, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER)
        end
    end

    local site = vgui.Create( "DButton", bg )
        site:SetSize( bg:GetWide() / 11, bg:GetTall() / 24.1 )
        site:SetText( "" )
        site:SetPos( bg:GetWide() / 4, bg:GetTall() / 6.5 )
        site:SetVisible( true )
        site.DoClick = function()

            hook.Remove( "HUDPaint", "OriginCam" )
            Boxy:Remove()

            surface.PlaySound( "gescape/button.mp3" )

            Boxy = vgui.Create( "DFrame", bg )
            Boxy:SetPos( bg:GetWide() / 6.5, bg:GetTall() / 4.9 )
            Boxy:SetTitle( "" )
            Boxy:SetDraggable( false )
            Boxy:DockMargin( 5, 5, 5, 5 )
            Boxy:ShowCloseButton( false )
            Boxy:SetSize( bg:GetWide() / 1.454, bg:GetTall() / 1.5 )
            Boxy.Paint = function()
                    draw.RoundedBox( 0, 0, 0, Boxy:GetWide(), Boxy:GetTall(), Color( 0, 0, 0, 235 ))
            end

            Website = vgui.Create( "HTML", Boxy )
            Website:SetPos( 0, 0 )
            Website:DockMargin( 5, 5, 5, 5 )
            Website:Dock( FILL )
            Website:OpenURL( config.Website )

            Webbar = vgui.Create( "DHTMLControls", Boxy )
            Webbar:SetWide( Boxy:GetWide() / 1.014 )
            Webbar:DockMargin( 5, 5, 5, 5 )
            Webbar:SetPos( 9, 0 )
            Webbar:SetHTML ( Website )
            Webbar.AddressBar:SetText( config.Website )
            
            Website:MoveBelow( Webbar )
        end

        site.Paint = function()
        if site:IsHovered() == true then
            draw.RoundedBox( 0, 0, 0, 200, 200, config.HoverBottom)
            draw.RoundedBox( 0, 0, 0, 200, 10, config.HoverTop)
            draw.DrawText(config.WName, "Mai", site:GetWide() / 2.1, site:GetTall() / 5, Color( 0, 0, 0, 255 ), TEXT_ALIGN_CENTER)
        else
            draw.RoundedBox( 0, 0, 0, 200, 200, config.MainColor)
            draw.DrawText(config.WName, "Mai", site:GetWide() / 2.1, site:GetTall() / 5, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER)
        end
    end

    local rules = vgui.Create( "DButton", bg )
        rules:SetSize( bg:GetWide() / 11, bg:GetTall() / 24.1 )
        rules:SetText( "" )
        rules:SetPos( bg:GetWide() / 2.26, bg:GetTall() / 6.5 )
        rules:SetVisible( true )
        rules.DoClick = function()

        hook.Remove( "HUDPaint", "OriginCam" )
        Boxy:Remove()

        surface.PlaySound( "gescape/button.mp3" )

        Boxy = vgui.Create( "DPanel", bg )
            Boxy:SetPos( bg:GetWide() / 6.5, bg:GetTall() / 4.9 )
            Boxy:SetSize( bg:GetWide() / 1.454, bg:GetTall() / 1.5 )
            Boxy:DockMargin( 5, 5, 5, 5 )
            Boxy.Paint = function()
                draw.RoundedBox(0, 0, 0, Boxy:GetWide(), Boxy:GetTall(), Color( 0, 0, 0, 235 ))
            end

        TheRules = vgui.Create( "DTextEntry", Boxy )
        TheRules:SetPos( 10, 10 )
        TheRules:Dock( FILL )
        TheRules:SetDrawBackground( false )
        TheRules:SetMultiline( true )
        TheRules:SetText(config.Text)
        TheRules:DockMargin( 5, 5, 5, 5 )
        TheRules:SetFont("Mai")
        TheRules:SetTextColor( Color( 255, 255, 255, 255 ) )
        TheRules:SetVerticalScrollbarEnabled( true )

        end
        rules.Paint = function()
        if rules:IsHovered() == true then
            draw.RoundedBox( 0, 0, 0, 200, 200, config.HoverBottom)
            draw.RoundedBox( 0, 0, 0, 200, 10, config.HoverTop)
            draw.DrawText(config.RName, "Mai", rules:GetWide() / 2.1, rules:GetTall() / 5, Color( 0, 0, 0, 255 ), TEXT_ALIGN_CENTER)
        else
            draw.RoundedBox( 0, 0, 0, 200, 200, config.MainColor)
            draw.DrawText(config.RName, "Mai", rules:GetWide() / 2.1, rules:GetTall() / 5, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER)
        end
    end

    local donate = vgui.Create( "DButton", bg )
        donate:SetSize( bg:GetWide() / 11, bg:GetTall() / 24.1 )
        donate:SetText( "" )
        donate:SetPos( bg:GetWide() / 2.89, bg:GetTall() / 6.5 )
        donate:SetVisible( true )
        donate.DoClick = function()

            Boxy:Remove()
            hook.Remove( "HUDPaint", "OriginCam" )
            
            surface.PlaySound( "gescape/button.mp3" )

            Boxy = vgui.Create( "DFrame", bg )
            Boxy:SetPos( bg:GetWide() / 6.5, bg:GetTall() / 4.9 )
            Boxy:SetTitle( "" )
            Boxy:SetDraggable( false )
            Boxy:DockMargin( 5, 5, 5, 5 )
            Boxy:ShowCloseButton( false )
            Boxy:SetSize( bg:GetWide() / 1.454, bg:GetTall() / 1.5 )
            Boxy.Paint = function()
                    draw.RoundedBox( 0, 0, 0, Boxy:GetWide(), Boxy:GetTall(), Color( 0, 0, 0, 235 ))
            end

            Donsite = vgui.Create( "HTML", Boxy )
            Donsite:SetPos( 0, 0 )
            Donsite:DockMargin( 5, 5, 5, 5 )
            Donsite:Dock( FILL )
            Donsite:OpenURL( config.Donate )

            Donbar = vgui.Create( "DHTMLControls", Boxy )
            Donbar:SetWide( Boxy:GetWide() / 1.014 )
            Donbar:DockMargin( 5, 5, 5, 5 )
            Donbar:SetPos( 9, 0 )
            Donbar:SetHTML ( Donsite )
            Donbar.AddressBar:SetText( config.Donate )
            
            Donsite:MoveBelow( Donbar )
        end

        donate.Paint = function()
        if donate:IsHovered() == true then
            draw.RoundedBox( 0, 0, 0, 200, 200, config.HoverBottom)
            draw.RoundedBox( 0, 0, 0, 200, 10, config.HoverTop)
            draw.DrawText(config.DName, "Mai", donate:GetWide() / 2.1, donate:GetTall() / 5, Color( 0, 0, 0, 255 ), TEXT_ALIGN_CENTER)
        else
            draw.RoundedBox( 0, 0, 0, 200, 200, config.MainColor)
            draw.DrawText(config.DName, "Mai", donate:GetWide() / 2.1, donate:GetTall() / 5, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER)
        end
    end

    local news = vgui.Create( "DButton", bg )
        news:SetSize( bg:GetWide() / 11, bg:GetTall() / 24.1 )
        news:SetText( "" )
        news:SetPos( bg:GetWide() / 1.856, bg:GetTall() / 6.5 )
        news:SetVisible( true )
        news.DoClick = function()

        surface.PlaySound("gescape/button.mp3")

        Boxy:Remove()

        Boxy = vgui.Create( "DPanel", bg )
            Boxy:SetPos( bg:GetWide() / 6.5, bg:GetTall() / 4.9 )
            Boxy:SetSize( bg:GetWide() / 1.454, bg:GetTall() / 1.5 )
            Boxy:DockMargin( 5, 5, 5, 5 )
            Boxy.Paint = function()
                draw.RoundedBox(0, 0, 0, Boxy:GetWide(), Boxy:GetTall(), Color( 0, 0, 0, 235 ))
            end

        TheRules = vgui.Create( "DTextEntry", Boxy )
        TheRules:SetPos( 10, 10 )
        TheRules:Dock( FILL )
        TheRules:SetDrawBackground( false )
        TheRules:SetMultiline( true )
        TheRules:SetText(config.NewsT)
        TheRules:DockMargin( 5, 5, 5, 5 )
        TheRules:SetFont("Mai")
        TheRules:SetTextColor( Color( 255, 255, 255, 255 ) )
        TheRules:SetVerticalScrollbarEnabled( true )
    end

        news.Paint = function()
        if news:IsHovered() == true then
            draw.RoundedBox( 0, 0, 0, 200, 200, config.HoverBottom)
            draw.RoundedBox( 0, 0, 0, 200, 10, config.HoverTop)
            draw.DrawText(config.NNews, "Mai", news:GetWide() / 2.1, news:GetTall() / 5, Color( 0, 0, 0, 255 ), TEXT_ALIGN_CENTER)
        else
            draw.RoundedBox( 0, 0, 0, 200, 200, config.MainColor)
            draw.DrawText(config.NNews, "Mai", news:GetWide() / 2.1, news:GetTall() / 5, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER)
        end
    end

    local Avatar = vgui.Create( "AvatarImage", bg )
    Avatar:SetSize( bg:GetWide() / 30, bg:GetTall() / 17 )
    Avatar:SetPos( bg:GetWide() / 1.27, bg:GetTall() / 12.7 )
    Avatar:SetPlayer( LocalPlayer(), 64 )

end

-- This is for removing bg and calling escapemenu:show 
hook.Add('PreRender', 'RemoveEscapeMenu', function()

        if gui.IsGameUIVisible() and input.IsKeyDown( KEY_ESCAPE ) then
            if ValidPanel( bg ) then
                bg:Remove()
                hook.Remove( "HUDPaint", "OriginCam" )
                hook.Remove( "HUDPaint", "blurscreen")
                gui.HideGameUI()
             else
                surface.PlaySound( "gescape/open.mp3" )
                escapemenu:show()
                gui.HideGameUI() 
            end
        end
    end)

surface.CreateFont( "Mai", {
    font = "Trebuchet24",
    size = ScreenScale( 25 ) * (640 / 1776),
    weight = 0,
    blursize = 0,
    antialias = true
} )

surface.CreateFont( "Heu", {
    font = "Trebuchet24",
    size = ScreenScale( 40 ) * (640 / 1776),
    weight = 0,
    blursize = 0,
    antialias = true
} )

surface.CreateFont( "Head", {
    font = "Typo College Demo",
    size = ScreenScale( 70 ) * (640 / 1776),
    weight = 0,
    blursize = 0,
    antialias = true
} )