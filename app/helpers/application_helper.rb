module ApplicationHelper
  def is_login
    if user_signed_in?
      content_tag :ul, class: 'navbar-nav ml-auto nav-flex-icons' do
        "<li class='nav-item dropdown'>
          <a class='nav-link dropdown-toggle' id='navbarDropdownMenuLink-333' data-toggle='dropdown'
            aria-haspopup='true' aria-expanded='false'>
            <i class='fas fa-user'></i>
          </a>
          <div class='dropdown-menu dropdown-menu-right dropdown-default'
            aria-labelledby'navbarDropdownMenuLink-333'>
            #{(link_to 'Profile', profile_path, class: 'dropdown-item')+
              (link_to 'Cart', cart_path, class: 'dropdown-item')+
              (link_to 'Transaction History', nil, class: 'dropdown-item')+
               '<hr/>'.html_safe+
              (link_to 'Logout', nil, class: 'dropdown-item')
             }
          </div>
        </li>".html_safe
      end
    else
     content_tag :span, class: 'navbar-text white-text' do
       (link_to '<button class="btn btn-dark">Login</button>'.html_safe,
        new_user_session_path) +

       (link_to '<button class="btn btn-dark">Register</button>'.html_safe,
        new_user_registration_path)
      end
    end
  end
end
