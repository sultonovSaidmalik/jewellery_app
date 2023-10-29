enum Strings {
  already('Already have an account?'),
  don("Don't have an account?"),
  getStarted('Get started'),
  skip('Skip'),
  create('Create\nAccount'),
  email('you@exaple.com'),
  password('Password'),
  confirmPassword('Confirm Password'),
  name('Name'),
  phone('Phone'),
  validEmail('Write your email'),
  validName('Write your name'),
  validPhone('Write your phone'),
  validPassword('Write your password'),
  validConfirmPassword('Write your confirm password'),
  invalidEmail('Invalid Email'),
  invalidPhone('Invalid phone number'),
  invalidPassword('Password must be at least 8 characters'),
  invalidConfirmPassword('your password does not match'),
  signIn('Sign in'),
  login('Log-in'),
  signUp('Sign up');

  const Strings(this.text);

  final String text;
}