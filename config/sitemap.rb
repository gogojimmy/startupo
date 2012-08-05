require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://startupo.cc'
SitemapGenerator::Sitemap.create do
  add '/about', :changefreq => 'monthly', :priority => 0.6
  add '/contact_us', :changefreq => 'weekly'
  add '/resources', :changefreq => 'daily', :priority => 0.8
  add '/events', :changefreq => 'weekly', :priority => 0.8
  Resource.public_resources.each do |resource|
    sitemap.add resource_path(resource), :lastmod => resource.updated_at
  end
  Event.all.each do |event|
    sitemap.add event_path(event), :lastmod => event.updated_at
  end
end
SitemapGenerator::Sitemap.ping_search_engines # called for you when you use the rake task
SitemapGenerator::Sitemap.sitemaps_path = 'shared/'
