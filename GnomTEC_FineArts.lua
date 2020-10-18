-- **********************************************************************
-- GnomTEC FineArts
-- Version: 9.0.1.1
-- Author: Peter Jack
-- URL: http://www.gnomtec.de/
-- **********************************************************************
-- Copyright © 2017-2020 by Peter Jack
--
-- Licensed under the EUPL, Version 1.1 only (the "Licence");
-- You may not use this work except in compliance with the Licence.
-- You may obtain a copy of the Licence at:
--
-- http://ec.europa.eu/idabc/eupl5
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the Licence is distributed on an "AS IS" basis,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the Licence for the specific language governing permissions and
-- limitations under the Licence.
-- **********************************************************************
-- load localization first.
local L = LibStub("AceLocale-3.0"):GetLocale("GnomTEC_FineArts")

-- ----------------------------------------------------------------------
-- Addon Info Constants (local)
-- ----------------------------------------------------------------------
-- addonInfo for addon registration to GnomTEC API
local addonInfo = {
	["Name"] = "GnomTEC FineArts",
	["Description"] = "GnomTEC FineArts.",	
	["Version"] = "9.0.1.1",
	["Date"] = "2020-10-19",
	["Author"] = "Peter Jack",
	["Email"] = "info@gnomtec.de",
	["Website"] = "http://www.gnomtec.de/",
	["Copyright"] = "© 2017-2020 by Peter Jack",
	["License"] = "European Union Public Licence (EUPL v.1.1)",	
	["FrameworkRevision"] = 13
}

-- ----------------------------------------------------------------------
-- Addon Global Constants (local)
-- ----------------------------------------------------------------------
-- Class levels
local CLASS_BASE	= 0
local CLASS_CLASS	= 1
local CLASS_WIDGET	= 2
local CLASS_ADDON	= 3

-- Log levels
local LOG_FATAL 	= 0
local LOG_ERROR		= 1
local LOG_WARN		= 2
local LOG_INFO 		= 3
local LOG_DEBUG 	= 4

-- ----------------------------------------------------------------------
-- Addon Static Variables (local)
-- ----------------------------------------------------------------------
local addonDataObject =	{
	type = "data source",
	text = "0 page(s)",
	value = "0",
	suffix = "page(s)",
	label = "GnomTEC Fine Arts",
	icon = [[Interface\Icons\INV_Misc_Book_09]],
	OnClick = function(self, button)
		GnomTEC_FineArts.SwitchMainWindow()
	end,
	OnTooltipShow = function(tooltip)
		GnomTEC_FineArts.ShowAddonTooltip(tooltip)
	end,
}

local Book = {
	pages = {
		-- Gedichte"
		-- Das Lied von der Glocke.
		-- Seite 1 
		[[<p>Fest gemauert in der Erden<br/>Steht die Form, aus Lehm gebrannt.<br/>Heute muß die Glocke werden,<br/>Frisch, Gesellen! seyd zur Hand.<br/></p><p><br/>Von der Stirne heiß<br/>Rinnen muß der Schweiß,<br/>Soll das Werk den Meister loben,<br/>Doch der Segen kommt von oben.<br/></p><p><br/>Zum Werke, das wir ernst bereiten,<br/>Geziemt sich wohl ein ernstes Wort;<br/>Wenn gute Reden sie begleiten,<br/>Dann fließt die Arbeit munter fort.<br/></p>]],
		-- Seite 2
		[[<p>So laßt uns jetzt mit Fleiß betrachten,<br/>Was durch die schwache Kraft entspringt,<br/>Den schlechten Mann muß man verachten,<br/>Der nie bedacht, was er vollbringt.<br/></p><p><br/>Das ist’s ja, was den Menschen zieret,<br/>Und dazu ward ihm der Verstand,<br/>Daß er im innern Herzen spüret,<br/>Was er erschafft mit seiner Hand.<br/></p><p><br/>Nehmet Holz vom Fichtenstamme,<br/>Doch recht trocken laßt es seyn,<br/>Daß die eingepreßte Flamme<br/>Schlage zu dem Schwalch hinein.<br/></p>]],
		-- Seite 3
		[[<p>Kocht des Kupfers Brey,<br/>Schnell das Zinn herbey,<br/>Daß die zähe Glockenspeise<br/>Fließe nach der rechten Weise.<br/></p><p><br/>Was in des Dammes tiefer Grube<br/>Die Hand mit Feuers Hilfe baut,<br/>Hoch auf des Thurmes Glockenstube<br/>Da wird es von uns zeugen laut.<br/></p><p><br/>Noch dauern wird’s in späten Tagen<br/>Und rühren vieler Menschen Ohr,<br/>Und wird mit dem Betrübten klagen,<br/>Und stimmen zu der Andacht Chor.<br/></p>]],
		-- Seite 4
		[[<p>Was unten tief dem Erdensohne<br/>Das wechselnde Verhängniß bringt,<br/>Das schlägt an die metallne Krone,<br/>Die es erbaulich weiter klingt.<br/></p><p><br/>Weiße Blasen seh’ ich springen,<br/>Wohl! die Massen sind im Fluß.<br/>Laßt’s mit Aschensalz durchdringen,<br/>Das befördert schnell den Guß.<br/></p><p><br/>Auch von Schaume rein<br/>Muß die Mischung seyn,<br/>Daß vom reinlichen Metalle<br/>Rein und voll die Stimme schalle.<br/></p>]]
		-- / Das Lied von der Glocke.
		-- / Gedichte
	} -- pages
} -- /Book
-- ----------------------------------------------------------------------
-- Addon Startup Initialization
-- ----------------------------------------------------------------------

-- ----------------------------------------------------------------------
-- Helper Functions (local)
-- ----------------------------------------------------------------------

-- ----------------------------------------------------------------------
-- Addon Class
-- ----------------------------------------------------------------------

local function GnomTECFineArts()
	-- call base class
	local self, protected = GnomTECAddon("GnomTEC_FineArts", addonInfo)
	
	-- when we got nil from base class there is a major issue and we will stop here.
	-- GnomTEC framework will inform the user by itself about the issue.
	if (nil == self) then
		return self
	end
	
	-- public fields go in the instance table
	-- self.field = value

	-- protected fields go in the protected table
	-- protected.field = value
	
	-- private fields are implemented using locals
	-- they are faster than table access, and are truly private, so the code that uses your class can't get them
	-- local field
	local mainWindowWidgets = nil
	
	local chat = GnomTECClassChat();


	-- private methods
	-- local function f()

	-- protected methods
	-- function protected.f()
	function protected.OnInitialize()
	 	-- Code that you want to run when the addon is first loaded goes here.
	end

	function protected.OnEnable()
  	  -- Called when the addon is enabled
				
		addonDataObject = self.NewDataObject("", addonDataObject)
		
		self.ShowMinimapIcon(addonDataObject)
	end

	function protected.OnDisable()
		-- Called when the addon is disabled
	end
	
	-- public methods
	-- function self.f()
	function self.SwitchMainWindow(show)
		if (not mainWindowWidgets) then
			mainWindowWidgets = {}
			mainWindowWidgets.mainWindow = GnomTECWidgetContainerWindow({title="GnomTEC FineArts", portrait=[[Interface\Icons\INV_Misc_Book_09]], name="Main", db=self.db})
			mainWindowWidgets.mainWindowLayout = GnomTECWidgetContainerLayoutVertical({parent=mainWindowWidgets.mainWindow})
			mainWindowWidgets.mainWindowTopSpacer = GnomTECWidgetSpacer({parent=mainWindowWidgets.mainWindowLayout, minHeight=34, minWidth=50})
			mainWindowWidgets.mainWindowBook = GnomTECWidgetBook({parent=mainWindowWidgets.mainWindowLayout, book=Book})
		end
		
		if (nil == show) then
			if mainWindowWidgets.mainWindow.IsShown() then
				mainWindowWidgets.mainWindow.Hide()
				PlaySound(SOUNDKIT.IG_SPELLBOOK_CLOSE)
			else
				mainWindowWidgets.mainWindow.Show()
				PlaySound(SOUNDKIT.IG_SPELLBOOK_OPEN)
			end
		else
			if show then
				mainWindowWidgets.mainWindow.Show()
				PlaySound(SOUNDKIT.IG_SPELLBOOK_OPEN)
			else
				mainWindowWidgets.mainWindow.Hide()
				PlaySound(SOUNDKIT.IG_SPELLBOOK_CLOSE)
			end
		end
	end
	
		
	function	self.ShowAddonTooltip(tooltip)
		tooltip:AddLine("GnomTEC FineArts Informationen",1.0,1.0,1.0)
		tooltip:AddLine(" ")
		tooltip:AddLine("Fine Arts.",1.0,1.0,1.0)
	end
	
	-- constructor
	do
		self.SwitchMainWindow(false)
		self.LogMessage(LOG_INFO, "Willkommen bei GnomTEC FineArts")
	end
	
	-- return the instance table
	return self
end

-- ----------------------------------------------------------------------
-- Addon Instantiation
-- ----------------------------------------------------------------------

GnomTEC_FineArts = GnomTECFineArts()
