# coding: UTF-8

=begin
/**
 * Rubriques obligatoires:
 * - CV
 * - Mes attentes
 * - Mes compétences pro
 * - Mes traits de personnalité
 * - Mon itinéraire pro passé
 * 
 * Non obligatoires mais recommandées
 * - Centres d'intérêts
 * - Motivation socio-pro
 * - Accidents de parcours
 * - Raisons des étapes
 * - Influences sur choix pro
 * - Contraintes perso
 * - Formations complémentaires
 */
=end

require 'sinatra'
require './navigation.rb'

get '/' do
	#'Hello world!'
	Navigation.instance.titleImgSrc = "/images/PageAccueil/title_accueil_tag.png"
	Navigation.instance.headerTitle = "Nicolas Buffon"
	Navigation.instance.pageTitle = "Moi !"
	erb :index
end

get '/aboutme/?' do
	redirect to('/')
end

get '/aboutme/:option/?' do |opt|
	if opt =~ /^cv\/?$/
		Navigation.instance.titleImgSrc = "/images/PageCV/title_cv_tag.png"
		Navigation.instance.headerTitle = "Curriculum Vitae"
		Navigation.instance.pageTitle = "Mon CV"
		erb :cv
	elsif opt =~ /^expectations\/?$/
		Navigation.instance.titleImgSrc = "/images/PageAttentes/title_attentes_tag.png"
		Navigation.instance.headerTitle = "Mes attentes"
		Navigation.instance.pageTitle = "Attentes"
		erb :expectations
	elsif opt =~ /^personnality\/?$/
		Navigation.instance.titleImgSrc = "/images/PagePersonnalite/title_personnalite_tag.png"
		Navigation.instance.headerTitle = "Mes traits de personnalité"
		Navigation.instance.pageTitle = "Personnalité"
		erb :personnality
	elsif opt =~ /^skills\/?$/
		Navigation.instance.titleImgSrc = "/images/PageCompetences/title_competences_tag.png"
		Navigation.instance.headerTitle = "Mes compétences"
		Navigation.instance.pageTitle = "Compétences"
		erb :skills
	elsif opt =~ /^experience\/?$/
		Navigation.instance.titleImgSrc = "/images/PageExperience/title_experience_tag.png"
		Navigation.instance.headerTitle = "Expérience professionelle"
		Navigation.instance.pageTitle = "Professionnel"
		erb :experience
	elsif opt =~ /^likes\/?$/
		Navigation.instance.titleImgSrc = "/images/PageLoisirs/title_loisirs_tag.png"
		Navigation.instance.headerTitle = "Mes loisirs"
		Navigation.instance.pageTitle = "Loisirs"
		erb :likes
	elsif opt =~ /^motivation\/$/
		Navigation.instance.titleImgSrc = "/images/PageMotivation/title_motivation_tag.png"
		Navigation.instance.headerTitle = "Ma motivation socio-professionelle"
		Navigation.instance.pageTitle = "Motivation"
		erb :motivation
	else
		redirect to('/aboutme')
	end
end

get '/aboutme/cv/download/?' do
	send_file 'public/pdf/cv.pdf', :filename => 'cv_nicolas_buffon'
end
