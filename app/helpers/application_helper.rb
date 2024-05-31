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
end
