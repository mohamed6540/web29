class RecentFile {
  final String? title, date, state, user;

  RecentFile({this.title, this.date, this.state, this.user});
}

List demoRecentFiles = [
  RecentFile(
    title: "Ventillator doesn't work",
    date: "01-03-2021",
    user: "mohamed",
    state: "Sent to company",
  ),
  RecentFile(
    title: "dialysis machine",
    date: "27-02-2021",
    user: "mohamed",
    state: "Solved",
  ),
  RecentFile(
    title: "Diffibrillator needs maintinance",
    date: "23-02-2021",
    user: "maha",
    state: "Contact mangment",
  ),
  RecentFile(
    title: "No oxygen for anathesia",
    date: "21-02-2021",
    user: "mohamed",
    state: "Solved",
  ),
  RecentFile(
    title: "Ventillator needs maintinance",
    date: "23-02-2021",
    user: "mohamed",
    state: "Requested",
  ),
  RecentFile(
    title: "Autoclave doesn't work",
    date: "25-02-2021",
    user: "maha",
    state: "Solved by Engineer",
  ),
  RecentFile(
    title: "X-ray isn't working",
    date: "25-02-2021",
    user: "maha",
    state: "Requested",
  ),
];
