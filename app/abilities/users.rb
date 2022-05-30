Canard::Abilities.for(:user) do
  can [:read, :create], Gig
  cannot [:destroy], Gig
end
