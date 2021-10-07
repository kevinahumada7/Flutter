import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const _PosterAndTitle(),
                const _Overview(),
                const _Overview(),
                const _Overview(),
                const CastingCards(),
              ]
            )
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.red[900],
      expandedHeight: 250,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.75, 1],
              colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
            ),
          ),
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 10),
          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 20),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/img/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  
  const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/img/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
            ),
          ),
          const SizedBox( width: 20 ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('movie.title', style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2),
              Text('movie.originaltitle', style: textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 2),

              Row(
                children: [
                  const Icon(Icons.star_border_outlined, size: 15, color: Colors.grey),
                  const SizedBox( width: 5 ),
                  Text('movie.voteAverage', style: textTheme.caption),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text('Exercitation commodo culpa laborum eiusmod proident excepteur minim duis quis consectetur. Non cillum exercitation sunt fugiat. Quis eu enim aute do magna. Nostrud consectetur incididunt cillum culpa officia ea enim mollit eiusmod. Ut proident eiusmod voluptate laborum dolore aliqua cupidatat.', textAlign: TextAlign.justify, style: Theme.of(context).textTheme.subtitle1),
    );
  }
}