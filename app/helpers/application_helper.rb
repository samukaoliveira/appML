module ApplicationHelper
    def format_date(date)
        date.strftime("%d de %B de %Y")
    end

    # Formata a data no formato curto "dia/mês/ano"
    def format_short_date(date)
        date.strftime("%d/%m/%Y")
    end

    def format_time(time)
        time.strftime("%H:%M")
      end

      def login_link
        return link_to "Login", new_usuario_session_path if current_usuario.nil?
        link_to "Logout", destroy_usuario_session_path, method: :delete, class:"nav-link"
      end
end
