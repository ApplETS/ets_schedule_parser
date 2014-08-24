FactoryGirl.define do
  factory :ang010, class: Hash do
    name "ANG010"
    groups [{:nb => 1,
             :periods =>
                 [{:weekday => "Lun", :start_time => "18:00", :end_time => "21:30", :type => "C"},
                  {:weekday => "Ven", :start_time => "18:00", :end_time => "20:00", :type => "TP"}]}]

    initialize_with { attributes }
  end

  factory :matest, class: Hash do
    name "MATEST"
    groups [{:nb => 1,
             :periods =>
                 [{:weekday => "Ven", :start_time => "13:30", :end_time => "17:00", :type => "C"},
                  {:weekday => "Mar", :start_time => "13:30", :end_time => "16:30", :type => "TP"}]},
            {:nb => 2,
             :periods =>
                 [{:weekday => "Mer", :start_time => "09:00", :end_time => "12:30", :type => "C"},
                  {:weekday => "Lun", :start_time => "09:00", :end_time => "12:00", :type => "TP"}]}]

    initialize_with { attributes }
  end

  factory :tin501, class: Hash do
    name "TIN501"
    groups [{:nb => 1,
             :periods =>
                 [{:weekday => "Mer", :start_time => "09:00", :end_time => "12:30", :type => "C"},
                  {:weekday => "Lun",
                   :start_time => "08:30",
                   :end_time => "12:30",
                   :type => "TP A+B"}]},
            {:nb => 2,
             :periods =>
                 [{:weekday => "Jeu", :start_time => "09:00", :end_time => "12:30", :type => "C"},
                  {:weekday => "Mar",
                   :start_time => "08:30",
                   :end_time => "12:30",
                   :type => "TP A+B"}]},
            {:nb => 3,
             :periods =>
                 [{:weekday => "Mer", :start_time => "13:30", :end_time => "17:00", :type => "C"},
                  {:weekday => "Ven",
                   :start_time => "08:30",
                   :end_time => "12:30",
                   :type => "TP A+B"}]},
            {:nb => 4,
             :periods =>
                 [{:weekday => "Mer", :start_time => "18:00", :end_time => "21:30", :type => "C"},
                  {:weekday => "Ven", :start_time => "18:00", :end_time => "20:00", :type => "TP"}]},
            {:nb => 5,
             :periods =>
                 [{:weekday => "Lun", :start_time => "18:00", :end_time => "21:30", :type => "C"},
                  {:weekday => "Ven", :start_time => "18:00", :end_time => "20:00", :type => "TP"}]},
            {:nb => 6,
             :periods =>
                 [{:weekday => "Ven", :start_time => "13:30", :end_time => "17:00", :type => "C"},
                  {:weekday => "Mar",
                   :start_time => "13:30",
                   :end_time => "17:30",
                   :type => "TP A+B"}]}]

    initialize_with { attributes }
  end

  factory :log750, class: Hash do
    name "LOG750"
    groups [{:nb => 1,
             :periods =>
                 [{:weekday => "Mar", :start_time => "18:00", :end_time => "21:30", :type => "C"},
                  {:weekday => "Jeu",
                   :start_time => "18:00",
                   :end_time => "20:00",
                   :type => "Labo"}]}]
    initialize_with { attributes }
  end

  factory :empty_course, class: Hash do
    groups []
    initialize_with { attributes }
  end

  factory :phy335, class: Hash do
    name "PHY335"
    groups [{:nb => 1,
             :periods =>
                 [{:weekday => "Mer", :start_time => "09:00", :end_time => "12:30", :type => "C"},
                  {:weekday => "Lun", :start_time => "09:00", :end_time => "12:00", :type => "TP"}]},
            {:nb => 2,
             :periods =>
                 [{:weekday => "Jeu", :start_time => "09:00", :end_time => "12:30", :type => "C"},
                  {:weekday => "Mar", :start_time => "09:00", :end_time => "12:00", :type => "TP"}]},
            {:nb => 3,
             :periods =>
                 [{:weekday => "Mer", :start_time => "13:30", :end_time => "17:00", :type => "C"},
                  {:weekday => "Ven", :start_time => "09:00", :end_time => "12:00", :type => "TP"}]}]

    initialize_with { attributes }
  end
end