Canard::Abilities.for(:user) do
  can [:read, :create, :edit, :destroy, :update], Gig

end
