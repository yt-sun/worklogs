Redmine::Plugin.register :worklogs do
  name 'Worklogs'
  author 'Iceskysl'
  description 'This is a worklogs plugin for Redmine'
  version '0.2.5'
  url 'https://github.com/IceskYsl/worklogs'
  author_url 'http://my.eoe.cn/iceskysl'
  
   project_module :worklogs do
    permission :all_worklogs, :worklogs => :index
    permission :my_worklogs, :worklogs => :my
    permission :new_worklogs, :worklogs => :new
    permission :vote_worklogs, :worklogs => :vote
   end
 
  canIndex = 0 
  # menu :top_menu, :worklogs, { :controller => 'worklogs', :action => 'index' }, :caption => :label_worklog #, :if => User.current.allowed_to?({:controller => "worklogs", :action => "index"},nil,{:global => true})

  menu :top_menu, :worklogs, { :controller => 'worklogs', :action => 'my' }, :caption => :label_worklog, :if => Proc.new { User.current.allowed_to?({:controller => "worklogs", :action=> "my" }, nil, {:global => true }) }

  # menu :application_menu, :worklogs, { :controller => 'worklogs', :action => 'index' }, :caption => :label_worklog
  # menu :application_menu, :worklogs_my, { :controller => 'worklogs', :action => 'my'}, :caption => :label_worklog_my ,:if => Proc.new { params[:controller] == "worklogs" }
  # menu :application_menu, :worklogs_new, { :controller => 'worklogs', :action => 'new' }, :caption => :label_worklog_new, :last => true
  # menu :project_menu, :worklogs, { :controller => 'worklogs', :action => 'new' }, :caption => :label_worklog, :before => :activity, :param => :project_id
   menu :project_menu, :worklogs_my, { :controller => 'worklogs', :action => 'my' }, :caption => :label_worklog_my, :before => :activity, :param => :project_id
  
  settings :default => {'empty' => true}, :partial => 'settings/worklogs_settings'
end
