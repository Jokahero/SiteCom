#coding: UTF-8

require 'singleton'

class Navigation 
	include Singleton
	attr_accessor :pageTitle, :headerTitle, :titleImgSrc
end
